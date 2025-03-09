transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor {D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor/skeleton.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor {D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor/regfile.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor {D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor/processor.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor {D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor/alu.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor {D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor/control_unit.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor {D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor/sign_extender.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor {D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor/RCA_12bit.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor {D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor/full_adder.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor {D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor/dffe_12.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor {D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor/dffe.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor {D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor/adder_plus1.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor {D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor/dmem.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor {D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor/imem.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor {D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor/clk_divn.v}

vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor {D:/Duke_HW/ECE_550D/Project_4_SimpleProcessor/skeleton_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  skeleton_tb

add wave *
view structure
view signals
run -all
