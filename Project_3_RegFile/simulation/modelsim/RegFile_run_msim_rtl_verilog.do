transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_3_RegFile {D:/Duke_HW/ECE_550D/Project_3_RegFile/regfile.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_3_RegFile {D:/Duke_HW/ECE_550D/Project_3_RegFile/reg_32bits.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_3_RegFile {D:/Duke_HW/ECE_550D/Project_3_RegFile/dec_5to32.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_3_RegFile {D:/Duke_HW/ECE_550D/Project_3_RegFile/w_port.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_3_RegFile {D:/Duke_HW/ECE_550D/Project_3_RegFile/r_port.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_3_RegFile {D:/Duke_HW/ECE_550D/Project_3_RegFile/tristate_buffer_32.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_3_RegFile {D:/Duke_HW/ECE_550D/Project_3_RegFile/reg_sets_of_32.v}
vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_3_RegFile {D:/Duke_HW/ECE_550D/Project_3_RegFile/dffe.v}

vlog -vlog01compat -work work +incdir+D:/Duke_HW/ECE_550D/Project_3_RegFile {D:/Duke_HW/ECE_550D/Project_3_RegFile/regfile_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  regfile_tb

add wave *
view structure
view signals
run -all
