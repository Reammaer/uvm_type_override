

quit -sim

cd ../questa

vlib work

vlog -work work ../sources/dut_if.sv
vlog -work work ../sources/dut_test.sv
vlog -work work ../tb/tb.sv

# Set variables for the UVM
# Test
set TEST_NAME base_test

vsim -novopt -t 1ns work.tb \
            +UVM_TESTNAME=$TEST_NAME


add wave -divider "Top-level signals"
add wave -radix unsigned tb/*

add wave -divider "DUT interface"
add wave -radix unsigned tb/_if/*

run 10us