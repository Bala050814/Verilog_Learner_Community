module binary2excess3(
    input [7:0] b_in,
    output [7:0] b_out
);

assign b_out = b_in + 8'd3;

endmodule