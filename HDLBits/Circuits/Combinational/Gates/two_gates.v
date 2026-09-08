module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    
    wire inter;
    assign inter=~(in1^in2);
    assign out=inter^in3;

endmodule
