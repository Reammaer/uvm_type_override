
`include "uvm_macros.svh"
import uvm_pkg::*;

`include "../sources/uvm_class_pkg.svh"
import uvm_class_pkg::*;

let CLK_PERIOD      = 10;
let RESET_DURATION  = 30;

module tb;

    // Time units
    timeunit        1ns;
    timeprecision   1ns;

    // Initialize global clock
    bit clk;
    always#(CLK_PERIOD) clk = ~clk;
    global clocking @(posedge clk);
    endclocking

    // Initialize interfaces
    dut_if _if (clk);

    // Initialize global reset
    initial begin
        _if.i_reset = 0;
        #(RESET_DURATION) _if.i_reset = 1;
        #(RESET_DURATION) _if.i_reset = 0;
    end

    // Initialize dut
    dut_test
    dut
    (
        .i_clk   (clk)
    ,   .i_reset (_if.i_reset)
    ,   .i_data  (_if.i_data)
    ,   .o_data  (_if.o_data)
    );

    // Run stimulus
    initial begin
        // Connect uvm_test_top interface with test
        uvm_config_db#(virtual dut_if)::set(null, "uvm_test_top", "dut_if", _if);
        // Run appropriate test
        run_test();
    end

endmodule: tb