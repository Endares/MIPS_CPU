module vga_controller(iRST_n,
                      iVGA_CLK,
                      oBLANK_n,
                      oHS,
                      oVS,
                      b_data,
                      g_data,
                      r_data,
							 ctrl_left,		// FPGA bottom control signals
							 ctrl_right,
							 ctrl_up,
							 ctrl_down,
							 last_data_received,	// PS2 keyboard control signals: previous data from ps2 board
							 ps2_key_pressed	// is the key pressed in ps2 board
							 );

	
input iRST_n;
input iVGA_CLK;
// control the direction of the block
input ctrl_left, ctrl_right, ctrl_up, ctrl_down;

input [7:0] last_data_received;
input ps2_key_pressed;

output reg oBLANK_n;
output reg oHS;
output reg oVS;
output [7:0] b_data;
output [7:0] g_data;  
output [7:0] r_data;                        
///////// ////                     
reg [18:0] ADDR;
reg [23:0] bgr_data;
reg [9:0] x, x_block;	// 640 rows
reg [8:0] y, y_block;	// 480 columns
reg [6:0] width;
wire VGA_CLK_n;
// changed
wire [7:0] index;
wire [23:0] bgr_data_raw;
wire [23:0] bgr_data_final;
wire cBLANK_n,cHS,cVS,rst;
////
assign rst = ~iRST_n;
video_sync_generator LTM_ins (.vga_clk(iVGA_CLK),
                              .reset(rst),
                              .blank_n(cBLANK_n),
                              .HS(cHS),
                              .VS(cVS));
										
parameter SCREEN_WIDTH = 640;
parameter SCREEN_HEIGHT = 480;
parameter BLOCK_WIDTH = 30;
// Initialize block coordinates and width 
initial begin
	x_block <= 1;
	y_block <= 1;
end

////Addresss generator
always@(posedge iVGA_CLK,negedge iRST_n)
begin
  if (!iRST_n)
     ADDR<=19'd0;
  else if (cHS==1'b0 && cVS==1'b0)
     ADDR<=19'd0;
  else if (cBLANK_n==1'b1)
     ADDR<=ADDR+1;
end
//////////////////////////
//////INDEX addr.
assign VGA_CLK_n = ~iVGA_CLK;

// Calculate coordinates
always @(posedge VGA_CLK_n) begin
    x = ADDR % SCREEN_WIDTH;
    y = ADDR / SCREEN_WIDTH;
end

// controls pixel value
img_data	img_data_inst (
	.address ( ADDR ),
	.clock ( VGA_CLK_n ),
	.q ( index )
	);
	
/////////////////////////
//////Add switch-input logic here
reg [31:0] count;	// clock divider
// bigger count, lower moving speed

/***************************** FPGA bottom control **********************************/

//always@(posedge VGA_CLK_n) begin
//   if (count == 500000) begin
//		count <= 32'd0;
//		if (~ctrl_left && x_block > 0) x_block = x_block - 1'b1;
//		else if (~ctrl_right && x_block < 640) x_block = x_block + 1'b1;
//		else if (~ctrl_up && y_block > 0) y_block = y_block - 1'b1;
//		else if (~ctrl_down && y_block < 480) y_block = y_block + 1'b1;
//		else if (~ctrl_left) x_block = 640;
//		else if (~ctrl_right) x_block = 0;
//		else if (~ctrl_up) y_block = 480;
//		else if (~ctrl_down) y_block = 0;
//	end
//	else count <= count + 32'b1;
//end

/**************************** PS2 keyboard control **********************************/

always@(posedge VGA_CLK_n) 
begin
	if (count == 500000) 
		begin
			count <= 32'd0;
			if (last_data_received == 8'h2d) 		// r:reset
				begin x_block = 1'b1; 
						y_block = 1'b1;
				end
			else if (last_data_received == 8'h1c && x_block > 00) x_block = x_block - 1'b1;	// up
			else if (last_data_received == 8'h23 && x_block < 640) x_block = x_block + 1'b1;	// down
			else if (last_data_received == 8'h1d && y_block > 00) y_block = y_block - 1'b1;	// left
			else if (last_data_received == 8'h1b && y_block < 480) y_block = y_block + 1'b1;	// right
			// out of scope, show on another side
			else if (last_data_received == 8'h1c) x_block = 640;
			else if (last_data_received == 8'h23) x_block = 0;
			else if (last_data_received == 8'h1d) y_block = 480;
			else if (last_data_received == 8'h1b) y_block = 0;
		end
	else count <= count + 32'b1;
end


//reg [3:0] direction_state; // 4个方向分别用1位表示：上、下、左、右
////reg [31:0] count;
//
//always @(posedge VGA_CLK_n) begin
//    if (last_data_received == 8'h75) begin
//        // 按下向上键
//        direction_state[0] <= 1'b1;
//    end else if (last_data_received == 8'h72) begin
//        // 按下向下键
//        direction_state[1] <= 1'b1;
//    end else if (last_data_received == 8'h6B) begin
//        // 按下向左键
//        direction_state[2] <= 1'b1;
//    end else if (last_data_received == 8'h74) begin
//        // 按下向右键
//        direction_state[3] <= 1'b1;
//    end else if (last_data_received == 8'hF0) begin
//        // 松开按键，下一个扫描码指示释放的是哪个键
//        case (last_data_received)
//            8'h75: direction_state[0] <= 1'b0; // 松开向上键
//            8'h72: direction_state[1] <= 1'b0; // 松开向下键
//            8'h6B: direction_state[2] <= 1'b0; // 松开向左键
//            8'h74: direction_state[3] <= 1'b0; // 松开向右键
//        endcase
//    end
//
//    // 计时器逻辑，定时更新方块位置
//    if (count == 500000) begin
//        count <= 32'd0; // 重置计时器
//        if (direction_state[2] && x_block > 0) x_block <= x_block - 1'b1; // 向左移动
//        else if (direction_state[3] && x_block < 640) x_block <= x_block + 1'b1; // 向右移动
//        else if (direction_state[0] && y_block > 0) y_block <= y_block - 1'b1; // 向上移动
//        else if (direction_state[1] && y_block < 480) y_block <= y_block + 1'b1; // 向下移动
//    end else begin
//        count <= count + 1; // 增加计时器
//    end
//end

// reg has_pressed;
//reg a, b, c, d, flag;
//initial begin
//	has_pressed = 1'b0;
//end
//
//always @(posedge VGA_CLK_n) begin
//        if (last_data_received == 8'hF0) begin
//            // Key release detected
//				has_pressed <= ~has_pressed;
//        end 
////		  else begin
////            // Key press detected
////            is_key_pressed <= 1'b1;
////            has_pressed <= 1'b1;
////        end
//
//    if (count == 500000 && has_pressed == 1'b1) begin
//        count <= 32'd0;
//        // Handle movement logic based on the key pressed
//        if (last_data_received == 8'h1c && x_block > 0) 
//            x_block <= x_block - 1'b1; // Left
//        else if (last_data_received == 8'h23 && x_block < 640) 
//            x_block <= x_block + 1'b1; // Right
//        else if (last_data_received == 8'h1d && y_block > 0) 
//            y_block <= y_block - 1'b1; // Up
//        else if (last_data_received == 8'h1b && y_block < 480) 
//            y_block <= y_block + 1'b1; // Down
//        else if (last_data_received == 8'h1c) 
//            x_block <= 640; // Wrap around for left
//        else if (last_data_received == 8'h23) 
//            x_block <= 0;   // Wrap around for right
//        else if (last_data_received == 8'h1d) 
//            y_block <= 480; // Wrap around for up
//        else if (last_data_received == 8'h1b) 
//            y_block <= 0;   // Wrap around for down
//        
//        has_pressed <= 1'b0;
//    end else begin
//        count <= count + 32'b1;
//    end
//end

//
//reg a, b, c, d, flag; // 分别代表 W, A, D, S 的按键状态
////reg [31:0] count; // 计时器，用于控制移动频率
//initial begin
//	flag = 1'b0;
//	a = 1'b0;
//	b = 1'b0;
//	c = 1'b0;
//	d = 1'b0;
//end
//
//always @(posedge VGA_CLK_n) begin
//    // 按键逻辑
//    if (last_data_received == 8'h1D) begin
//        if (flag == 1'b1) begin
//            a <= 1'b0; // 松开 W 键
//            flag <= 1'b0; // 重置 flag
//        end else begin
//            a <= 1'b1; // 按下 W 键
//        end
//    end else if (last_data_received == 8'h1C) begin
//        if (flag == 1'b1) begin
//            b <= 1'b0; // 松开 A 键
//            flag <= 1'b0; // 重置 flag
//        end else begin
//            b <= 1'b1; // 按下 A 键
//        end
//    end else if (last_data_received == 8'h23) begin
//        if (flag == 1'b1) begin
//            c <= 1'b0; // 松开 D 键
//            flag <= 1'b0; // 重置 flag
//        end else begin
//            c <= 1'b1; // 按下 D 键
//        end
//    end else if (last_data_received == 8'h1B) begin
//        if (flag == 1'b1) begin
//            d <= 1'b0; // 松开 S 键
//            flag <= 1'b0; // 重置 flag
//        end else begin
//            d <= 1'b1; // 按下 S 键
//        end
//    end else if (last_data_received == 8'hF0) begin
//        flag <= 1'b1; // 记录收到松开标志
//    end
//
//    // 移动逻辑
//    if (count == 500000) begin
//        count <= 32'd0; // 重置计时器
//        if (a == 1'b1 && y_block > 0) begin
//            y_block <= y_block - 1'b1; // 向上移动
//        end else if (b == 1'b1 && x_block > 0) begin
//            x_block <= x_block - 1'b1; // 向左移动
//        end else if (c == 1'b1 && x_block < 640) begin
//            x_block <= x_block + 1'b1; // 向右移动
//        end else if (d == 1'b1 && y_block < 480) begin
//            y_block <= y_block + 1'b1; // 向下移动
//        end
//    end else begin
//        count <= count + 1; // 计时器增加
//    end
//end

//////Color table output, controls pixel location
img_index	img_index_inst (
	.address ( index ),
	.clock ( iVGA_CLK ),
	.q ( bgr_data_raw )
	);	
//////
//////latch valid data at falling edge;
assign bgr_data_final = (x >= x_block && x < x_block + BLOCK_WIDTH && 
                         y >= y_block && y < y_block + BLOCK_WIDTH) 
                        ? 24'hffeb3f : bgr_data_raw;
always@(posedge VGA_CLK_n) bgr_data <= bgr_data_final;
assign b_data = bgr_data[23:16];
assign g_data = bgr_data[15:8];
assign r_data = bgr_data[7:0]; 
///////////////////
//////Delay the iHD, iVD,iDEN for one clock cycle;
always@(negedge iVGA_CLK)
begin
  oHS<=cHS;
  oVS<=cVS;
  oBLANK_n<=cBLANK_n;
end

endmodule

