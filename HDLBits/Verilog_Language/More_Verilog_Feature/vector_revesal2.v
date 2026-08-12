module top_module( 
    input [99:0] in,
    output [99:0] out
);
    generate
        genvar i;
        for(i=0;i<100;i=i+1) begin : FA
        
         assign out[i]=in[99-i];
        
    end
    endgenerate

endmodule
