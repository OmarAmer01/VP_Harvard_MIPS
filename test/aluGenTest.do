restart -nowave

# INPUTS

add wave -position end -radix hex -color yellow sim:/ALU/a
add wave -position end -radix hex -color yellow sim:/ALU/b
add wave -position end -radix hex -color yellow sim:/ALU/opSel

# OUTPUTS

add wave -position end -radix hex -color orange sim:/ALU/result

add wave -position end  sim:/ALU/carryFlag
add wave -position end  sim:/ALU/signFlag
add wave -position end  sim:/ALU/zeroFlag

# ASSIGNING VALUES

force -freeze sim:/ALU/a 16#ABCDABCD 0
force -freeze sim:/ALU/b 16#12345678 0

# TEST CASES

# 1. NOT
force -freeze sim:/ALU/opSel 16#0 0
run

# 2. AND
force -freeze sim:/ALU/opSel 16#1 0
run

# 3. OR
force -freeze sim:/ALU/opSel 16#2 0
run

# 4. XOR
force -freeze sim:/ALU/opSel 16#3 0
run

# 5. XNOR
force -freeze sim:/ALU/opSel 16#4 0
run

# 6. NOR
force -freeze sim:/ALU/opSel 16#5 0
run

# 7. NAND
force -freeze sim:/ALU/opSel 16#6 0
run

# 8. SLL
force -freeze sim:/ALU/opSel 16#7 0
run

# 9. SRL
force -freeze sim:/ALU/opSel 16#8 0
run

# 10. ADD
force -freeze sim:/ALU/opSel 16#9 0
run

# 11. SUB
force -freeze sim:/ALU/opSel 16#A 0
run

# 12. MUL
force -freeze sim:/ALU/opSel 16#B 0
run

# 13. DIV
force -freeze sim:/ALU/opSel 16#C 0
run

