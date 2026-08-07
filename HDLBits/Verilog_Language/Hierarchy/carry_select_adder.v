module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum1,sum2,sum3,sum4;
    wire c1,c2,c3;
    
    add16 ad1(.a(a[15:0]),.b(b[15:0]),.cin(0),.sum(sum1),.cout(c1));
    add16 ad2(.a(a[31:16]),.b(b[31:16]),.cin(0),.sum(sum2),.cout(c2));
    add16 ad3(.a(a[31:16]),.b(b[31:16]),.cin(1),.sum(sum3),.cout(c3));
                   
    assign sum4=c1?sum3:sum2;
    assign sum={sum4,sum1};
    
endmodule
