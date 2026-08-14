module comparator(
    input a, b,
    output equal, aless, agreat
);

assign equal  = ~(a ^ b);
assign aless  = ~a & b;
assign agreat = a & ~b;

endmodule