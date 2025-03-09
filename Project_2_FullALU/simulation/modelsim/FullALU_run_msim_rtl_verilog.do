transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_2_FullALU {D:/Duke_HW/ECE_550D/Project_2_FullALU/full_adder.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_2_FullALU {D:/Duke_HW/ECE_550D/Project_2_FullALU/alu.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_2_FullALU {D:/Duke_HW/ECE_550D/Project_2_FullALU/RCA_8bit_pro.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_2_FullALU {D:/Duke_HW/ECE_550D/Project_2_FullALU/CSA_32bit.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_2_FullALU {D:/Duke_HW/ECE_550D/Project_2_FullALU/RCA_8bit.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_2_FullALU {D:/Duke_HW/ECE_550D/Project_2_FullALU/ADD.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_2_FullALU {D:/Duke_HW/ECE_550D/Project_2_FullALU/SUB.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_2_FullALU {D:/Duke_HW/ECE_550D/Project_2_FullALU/SLL.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_2_FullALU {D:/Duke_HW/ECE_550D/Project_2_FullALU/SRA.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_2_FullALU {D:/Duke_HW/ECE_550D/Project_2_FullALU/alu_AND.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_2_FullALU {D:/Duke_HW/ECE_550D/Project_2_FullALU/alu_OR.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_2_FullALU {D:/Duke_HW/ECE_550D/Project_2_FullALU/mux8_32bit.v}

vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_2_FullALU {D:/Duke_HW/ECE_550D/Project_2_FullALU/alu_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
