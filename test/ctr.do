restart -nowave

add wave -position end -radix hex  sim:/ctr/clk
add wave -position end -radix hex  sim:/ctr/rst
add wave -position end -radix hex  sim:/ctr/en
add wave -position end -radix hex  sim:/ctr/dir
add wave -position end -radix hex  sim:/ctr/ctrOut

force -freeze sim:/ctr/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/ctr/rst 0 0
force -freeze sim:/ctr/en 1 0
force -freeze sim:/ctr/dir 1 0
run
run
run

run
run
run

run
run
run

run
force -freeze sim:/ctr/rst 1 0
run
force -freeze sim:/ctr/rst 0 0
run
force -freeze sim:/ctr/dir 0 0

run
run
run

run
run
run

run
run
run

run
run
run
run

force -freeze sim:/ctr/en 0 0


run
run
run
run