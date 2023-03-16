

interface dut_if (input clk);

    logic           i_reset;
    logic [7:0]     i_data ;
    logic [7:0]     o_data ;

    logic [10:0]    tr_count = 0;

endinterface: dut_if