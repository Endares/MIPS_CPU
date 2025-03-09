transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_1 {D:/Duke_HW/ECE_550D/Project_1/alu.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_1 {D:/Duke_HW/ECE_550D/Project_1/full_adder.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_1 {D:/Duke_HW/ECE_550D/Project_1/RCA_8bit.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_1 {D:/Duke_HW/ECE_550D/Project_1/RCA_8bit_pro.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_1 {D:/Duke_HW/ECE_550D/Project_1/CSA_32bit.v}

vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_1 {D:/Duke_HW/ECE_550D/Project_1/alu_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
