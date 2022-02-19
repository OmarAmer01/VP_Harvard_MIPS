transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+G:/VP/hdl/ALU {G:/VP/hdl/ALU/shifter.v}
vlog -vlog01compat -work work +incdir+G:/VP/hdl/regFile {G:/VP/hdl/regFile/regFile.v}
vlog -vlog01compat -work work +incdir+G:/VP/hdl/Mem {G:/VP/hdl/Mem/ctr.v}
vlog -vlog01compat -work work +incdir+G:/VP/hdl/ALU {G:/VP/hdl/ALU/FA.v}
vlog -vlog01compat -work work +incdir+G:/VP/hdl/ALU {G:/VP/hdl/ALU/ALU.v}
vlog -vlog01compat -work work +incdir+G:/VP/hdl {G:/VP/hdl/topProc.v}
vlog -vlog01compat -work work +incdir+G:/VP/hdl {G:/VP/hdl/jmpCtrl.v}
vlog -vlog01compat -work work +incdir+G:/VP/hdl/Mem {G:/VP/hdl/Mem/ram.v}
vlog -vlog01compat -work work +incdir+G:/VP/hdl/Mem {G:/VP/hdl/Mem/irom.v}
vlog -vlog01compat -work work +incdir+G:/VP/hdl {G:/VP/hdl/ctrlUnit.v}

