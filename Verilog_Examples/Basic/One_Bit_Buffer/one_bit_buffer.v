module one_bit_buffer(input wire in,output wire out);
wire sub_wire;
assign sub_wire=in;
assign out = ~(~sub_wire);

endmodule
