/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Inputs
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,                  // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB                   // I: Data from port B of regfile
);
    // Control signals
    input clock, reset;

    // Imem
    output [11:0] address_imem;
    input [31:0] q_imem;

    // Dmem
    output [11:0] address_dmem;
    output [31:0] data;
    output wren;	// DMen
    input [31:0] q_dmem;

    // Regfile
    output ctrl_writeEnable;	// Rwe
    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    output [31:0] data_writeReg;
    input [31:0] data_readRegA, data_readRegB;

    /* YOUR CODE STARTS HERE */
	 // wires
	 // PC
	 wire [11:0] pc_in, pc_out;	 
	 // PC5 extension
	 wire [11:0] pc_1, pc_1_N, pc_T, pc_rd;
	 // mux's out put
	 wire [11:0] pc_mux1, pc_mux2;
	 
	 // control unit
	 wire Rwe, Rtarget, ALUinB, DMwe, Rwd, is_R_type, is_ovf_type;
	 wire [31:0] ovf_sig;
	 wire ovf_ctrl;	// ovf && is_ovf_type
	 // PC5 extension
	 wire setx, bne, blt, j1, j2, jal, bex;
	 
	 // RegFile
	 wire [4:0] rd, rt;
	 // PC5 extension: 
	 // rd1: jal: write to $31
	 // rs, rt1: bex & isNotEqual: compare $0 to $30($rstatus)
	 wire [4:0] rd1, rs, rt1;
	 // PC5 extension: what to write back to $rd
	 wire [31:0] rw1, rw2;
	 
	 // ALU
	 wire overflow, isLessThan, isNotEqual;
	 wire [31:0] data_operandA, data_operandB, data_result;
	 wire [31:0] extend_immed;
	 wire [4:0] shamt, ALUop;
	 // PC5 extention
	 wire [31:0] extend_jump;	// JI-type
	 
	 // connection
	 // PC
	 adder_plus1 pc_incrementer(.in(pc_out), .out(pc_1));
	 dffe_12 pc(.d(pc_in), .q(pc_out), .clk(clock), .en(1'b1), .clr(reset));

	 // branch adder: (PC + 1) + (N: q_imem[16:0], truncated to [11:0])
	 RCA_12bit branch_adder(.a(pc_1), .b(q_imem[11:0]), .cin(0), .s(pc_1_N), .cout());
	 
	 // pc_mux1: branch or not. 1: pc+1+N, 0: pc+1
	 // branch = 1, when: bne & isNotEqual | blt & (~isLessThan) & isNotEqual
	 // blt: branch if $rt > $rs. isLessThan: $rs < $rt.
	 assign pc_mux1 = (((bne & isNotEqual) | (blt & (~isLessThan) & isNotEqual))) ? pc_1_N : pc_1;
	 
	 // pc_mux2: jump to T.
	 // j1(j | jal) | bex & isNotEqual = 1: T(q_imem[26:0] truncated to [11:0]), 0: pc_mux1
	 assign pc_mux2 = (j1 | bex & isNotEqual) ? q_imem[11:0] : pc_mux1;
	 
	 // pc_mux3: output connect to pc_in.
	 // j2(jr) = 1- jump to $rd, which is $rt(data_readRegB[11:0]), 0: pc_mux2
	 assign pc_in = j2 ? data_readRegB[11:0] : pc_mux2;
	 
	 // Imem
	 assign address_imem = pc_out;
	 
	 // control unit
	 control_unit myCtrl(
		.opcode(q_imem[31:27]), .ALUop(q_imem[6:2]), 
		.Rwe(Rwe), .Rtarget(Rtarget), .ALUinB(ALUinB), .DMwe(DMwe), .Rwd(Rwd), 
		.is_R_type(is_R_type), .is_ovf_type(is_ovf_type), .ovf_sig(ovf_sig),
		.setx(setx), .bne(bne), .blt(blt), .j1(j1), .j2(j2), .jal(jal), .bex(bex)
		);
		
	 and g1(ovf_ctrl, overflow, is_ovf_type);
	
	 // connect to module output
	 assign rt1 = Rtarget ? q_imem[26:22] : q_imem[16:12];
	 // rd1: write status code to $rstatus($30) when overflow
	 assign rd1 = (ovf_ctrl | setx) ? 5'd30 : q_imem[26:22];
	 // PC5 extension: write pc + 1 to $31 when jal
	 assign rd = jal ? 5'd31 : rd1;
	 // PC5 extension: bex & isNotEqual: compare $0 to $30($rstatus)
	 assign rs = bex & isNotEqual ? 5'd0 : q_imem[21:17];
	 assign rt = bex & isNotEqual ? 5'd30 : rt1;
	 
	 // RegFile
    assign ctrl_writeEnable = Rwe;
    assign wren = DMwe;
	 assign ctrl_writeReg = rd;
	 assign ctrl_readRegA = rs;
	 assign ctrl_readRegB = rt;
	 // PC5 extension
	 // rw mux1: 1x: ovf_sig, 01: q_dmem, 00: data_result(from alu)
	 assign rw1 = ovf_ctrl ? ovf_sig : (Rwd ? q_dmem : data_result);
	 // rw mux2: setx = 1: T[26:0] sign extended to T[31:0]; 0: rw1;
	 sign_extender_27to32 sx_jump (.immed(q_imem[26:0]), .extend_immed(extend_jump));
	 assign rw2 = setx ? extend_jump : rw1;
	 // rw mux_3: jal = 1: pc + 1 (higher 20 bits all 0, pc is unsigned); 0: rw2
	 assign data_writeReg = jal ? pc_1[11:0] : rw2;
	 
	 // ALU
	 sign_extender sx(.immed(q_imem[16:0]), .extend_immed(extend_immed));
	 
	 assign data_operandA = data_readRegA;
	 // PC5 extension: ALUinB = 1 ? extended_immed : data_readRegB
	 assign data_operandB = ALUinB ? extend_immed : data_readRegB;
	 assign shamt = is_R_type ? q_imem[11:7] : 5'd0;
	 assign ALUop = is_R_type ? q_imem[6:2] : 5'd0;
	 
	 alu myALU(
		.data_operandA(data_operandA), .data_operandB(data_operandB), 
		.ctrl_ALUopcode(ALUop), .ctrl_shiftamt(shamt), 
		.data_result(data_result), 
		.isNotEqual(isNotEqual), .isLessThan(isLessThan), .overflow(overflow)
		);
		
	 // Dmem
	 assign address_dmem = data_result[11:0];
	 assign data = data_readRegB;
	 
	 

endmodule