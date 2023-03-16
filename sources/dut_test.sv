

module dut_test
(
    input logic         i_clk
,   input logic         i_reset
,   input logic [7:0]   i_data
,   output logic [7:0]  o_data
);

    always_ff @(posedge i_clk) begin
        if (!i_reset) begin
            o_data <= i_data;
        end
        else begin
            o_data <= 0;
        end
    end

endmodule: dut_test