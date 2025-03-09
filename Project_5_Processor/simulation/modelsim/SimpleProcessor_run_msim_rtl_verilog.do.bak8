transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_5_Processor {D:/Duke_HW/ECE_550D/Project_5_Processor/skeleton.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_5_Processor {D:/Duke_HW/ECE_550D/Project_5_Processor/regfile.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_5_Processor {D:/Duke_HW/ECE_550D/Project_5_Processor/processor.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_5_Processor {D:/Duke_HW/ECE_550D/Project_5_Processor/alu.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_5_Processor {D:/Duke_HW/ECE_550D/Project_5_Processor/control_unit.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_5_Processor {D:/Duke_HW/ECE_550D/Project_5_Processor/sign_extender.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_5_Processor {D:/Duke_HW/ECE_550D/Project_5_Processor/RCA_12bit.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_5_Processor {D:/Duke_HW/ECE_550D/Project_5_Processor/full_adder.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_5_Processor {D:/Duke_HW/ECE_550D/Project_5_Processor/dffe_12.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_5_Processor {D:/Duke_HW/ECE_550D/Project_5_Processor/dffe.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_5_Processor {D:/Duke_HW/ECE_550D/Project_5_Processor/adder_plus1.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_5_Processor {D:/Duke_HW/ECE_550D/Project_5_Processor/dmem.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_5_Processor {D:/Duke_HW/ECE_550D/Project_5_Processor/imem.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_5_Processor {D:/Duke_HW/ECE_550D/Project_5_Processor/clk_divn.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_5_Processor {D:/Duke_HW/ECE_550D/Project_5_Processor/sign_extender_27to32.v}

vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_5_Processor {D:/Duke_HW/ECE_550D/Project_5_Processor/skeleton_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  skeleton_tb

add wave *
view structure
view signals
run -all
