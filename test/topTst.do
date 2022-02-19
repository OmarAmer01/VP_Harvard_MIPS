# Restart sim:
restart -nowave





# Add control signals:
add wave -position end  sim:/top/clk
add wave -position end  sim:/top/rst

# Add debugging signals:

add wave -position end -radix hex -color white  sim:/top/ctrlUnitInstIn

add wave -position end -radix hex -color yellow sim:/top/waddr
add wave -position end -radix hex -color yellow sim:/top/raddr1
add wave -position end -radix hex -color yellow sim:/top/raddr2

add wave -position end -radix hex sim:/top/aluOpSel
add wave -position end -radix hex -color orange sim:/top/aluRes
add wave -position end -radix hex -color cyan sim:/top/instAddr

add wave -position end -radix hex -color white sim:/top/port
add wave -position end -radix hex -color green sim:/top/memMuxAddrOut

# add wave -position end -radix hex -color magenta sim:/top/databus1


add wave -position end  sim:/top/progCtrjmp



# add wave -position end -radix hex -color white  sim:/top/regA
# add wave -position end -radix hex -color white  sim:/top/regB


add wave -position end -radix hex  sim:/top/aluOp2

# Reset the processor:
force -freeze sim:/top/extClk 1 0, 0 {50 ps} -r 100

force -freeze sim:/top/rst 1 0
run
force -freeze sim:/top/rst 0 0
run

# Load Instructions into IROM:
# mem load -i G:/VP/simulation/goodisa.mem /top/instRom/rom
