module be3_tb;

reg [7:0] b_in;
wire [7:0] b_out;

binary2excess3 dut(b_in, b_out);

initial
begin

    b_in = 8'd25;
    #10
    $display("b_out = %d", b_out);

    b_in = 8'd60;
    #10

    $display("b_out = %d", b_out);

    $finish;
end

endmodule