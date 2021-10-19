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

#######

# MOV AX, ABCD1234
force -freeze sim:/regFile/waddr 000 0
force -freeze sim:/regFile/raddr1 000 0
force -freeze sim:/regFile/databus1 16#ABCD1234 0
run
noforce sim:/regFile/databus1
run
#######

# MOV BX, EF123456
# Put AX on databus2
force -freeze sim:/regFile/sto 1 0
force -freeze sim:/regFile/dataIn 16#EF123456  0
force -freeze sim:/regFile/waddr 001 0
force -freeze sim:/regFile/raddr1 000 0
force -freeze sim:/regFile/raddr2 000 0
#force -freeze sim:/regFile/databus1 16#EF123456 0
run
noforce sim:/regFile/databus1
force -freeze sim:/regFile/sto 0 0
run
#######

# MOV CX, 12345678
force -freeze sim:/regFile/sto 1 0
force -freeze sim:/regFile/waddr 010 0
force -freeze sim:/regFile/raddr1 000 0
force -freeze sim:/regFile/dataIn 16#12345678  0
force -freeze sim:/regFile/databus1 16#adadadad 0
run
noforce sim:/regFile/databus1
run
#######

# MOV AX, CX
force -freeze sim:/regFile/sto 0 0
force -freeze sim:/regFile/raddr1 010 0
force -freeze sim:/regFile/waddr 000 0
run