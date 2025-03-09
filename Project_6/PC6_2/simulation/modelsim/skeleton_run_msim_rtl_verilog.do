transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2 {C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/VGA_Audio_PLL.v}
vlog -vlog01compat -work work +incdir+C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2 {C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/Reset_Delay.v}
vlog -vlog01compat -work work +incdir+C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2 {C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/skeleton.v}
vlog -vlog01compat -work work +incdir+C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2 {C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/PS2_Interface.v}
vlog -vlog01compat -work work +incdir+C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2 {C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/PS2_Controller.v}
vlog -vlog01compat -work work +incdir+C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2 {C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/processor.v}
vlog -vlog01compat -work work +incdir+C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2 {C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/pll.v}
vlog -vlog01compat -work work +incdir+C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2 {C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/imem.v}
vlog -vlog01compat -work work +incdir+C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2 {C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/Hexadecimal_To_Seven_Segment.v}
vlog -vlog01compat -work work +incdir+C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2 {C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/dmem.v}
vlog -vlog01compat -work work +incdir+C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2 {C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/Altera_UP_PS2_Data_In.v}
vlog -vlog01compat -work work +incdir+C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2 {C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/Altera_UP_PS2_Command_Out.v}
vlog -vlog01compat -work work +incdir+C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2 {C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/vga_controller.v}
vlog -vlog01compat -work work +incdir+C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2 {C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/video_sync_generator.v}
vlog -vlog01compat -work work +incdir+C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2 {C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/img_index.v}
vlog -vlog01compat -work work +incdir+C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2 {C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/img_data.v}
vlog -vlog01compat -work work +incdir+C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/db {C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/db/pll_altpll.v}
vlog -sv -work work +incdir+C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2 {C:/Users/endar/Desktop/PS2_skeleton_restored-2/PC6_2/lcd.sv}

