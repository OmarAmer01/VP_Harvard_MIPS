restart -nowave
force -freeze sim:/shReg/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/shReg/d 16#AAAAFFFF 0
force -freeze sim:/shReg/dir {} 0
force -freeze sim:/shReg/dir St1 0

add wave -position end  sim:/shReg/rst
add wave -position end  sim:/shReg/clk
add wave -position end  sim:/shReg/dir
add wave -position end  sim:/shReg/d
add wave -position end  sim:/shReg/q



force -freeze sim:/shReg/rst 1 0
run
force -freeze sim:/shReg/rst 0 0