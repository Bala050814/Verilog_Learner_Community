module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire[15:0] sum1,sum2;
    wire c1,c2;
    wire [31:0] d;
    assign d=b^{32{sub}};
    add16 ad1(.a(a[15:0]),.b(d[15:0]),.cin(sub),.sum(sum1),.cout(c1));
    add16 ad2(.a(a[31:16]),.b(d[31:16]),.cin(c1),.sum(sum2),.cout(c2));
    
    
    assign sum={sum2,sum1};

endmodule
