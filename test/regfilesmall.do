restart -nowave

add wave -position end -radix hex -color aquamarine sim:/regFile/dataIn
add wave -position end -radix hex -color aquamarine sim:/regFile/sto

add wave -position end -radix hex -color cyan sim:/regFile/waddr
add wave -position end -radix hex -color cyan sim:/regFile/raddr1
add wave -position end -radix hex -color cyan sim:/regFile/raddr2



add wave -position end  sim:/regFile/clk
add wave -position end -color white sim:/regFile/rst

add wave -position end -radix hex -color yellow sim:/regFile/databus1
add wave -position end -radix hex -color yellow sim:/regFile/databus2

add wave -position end -color magenta  sim:/regFile/wdcdOut
add wave -position end -color magenta  sim:/regFile/rdcdOut1
add wave -position end -color magenta  sim:/regFile/rdcdOut2

add wave -position end -radix hex -color orange sim:/regFile/axOut
add wave -position end -radix hex -color orange sim:/regFile/bxOut
add wave -position end -radix hex -color orange sim:/regFile/cxOut
add wave -position end -radix hex -color orange sim:/regFile/dxOut
add wave -position end -radix hex -color orange sim:/regFile/gxOut
add wave -position end -radix hex -color orange sim:/regFile/exOut
add wave -position end -radix hex -color orange sim:/regFile/eyOut
add wave -position end -radix hex -color orange sim:/regFile/ezOut

##################################################################

# RESET
force -freeze sim:/regFile/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/regFile/rst 1 0
run
force -freeze sim:/regFile/rst 0 0