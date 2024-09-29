transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU {C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU/funit.v}
vlog -vlog01compat -work work +incdir+C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU {C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU/shifter.v}
vlog -vlog01compat -work work +incdir+C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU {C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU/myALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU {C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU/arith.v}
vlog -vlog01compat -work work +incdir+C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU {C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU/rfile.v}
vlog -vlog01compat -work work +incdir+C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU {C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU/cpu_dp.v}
vlog -vlog01compat -work work +incdir+C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU {C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU/cpu_cont.v}
vlog -vlog01compat -work work +incdir+C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU {C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU/rca.v}
vlog -vlog01compat -work work +incdir+C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU {C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU/FA1.v}
vlog -vlog01compat -work work +incdir+C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU {C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU/MM.v}
vlog -vlog01compat -work work +incdir+C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU {C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU/cwrom.v}
vlog -vlog01compat -work work +incdir+C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU {C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU/clk_1k.v}
vlog -vlog01compat -work work +incdir+C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU {C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU/cpu16.v}
vlog -vlog01compat -work work +incdir+C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU {C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU/CPU_top.v}
vlog -vlog01compat -work work +incdir+C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU/db {C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU/db/clk_1k_altpll.v}

vlog -vlog01compat -work work +incdir+C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU {C:/Users/LeeJaeHwa/Documents/qtss/dd/CPU/tb_cpu.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_cpu

add wave *
view structure
view signals
run -all
