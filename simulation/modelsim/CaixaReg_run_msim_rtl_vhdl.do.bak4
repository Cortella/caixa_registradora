transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Aluno/Desktop/Gustavo/CaixaReg.vhd}

vcom -93 -work work {C:/Users/Aluno/Desktop/Gustavo/CaixaReg_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  CaixaReg_tb

add wave *
view structure
view signals
run -all
