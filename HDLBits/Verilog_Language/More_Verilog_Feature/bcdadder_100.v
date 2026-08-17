module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    
    wire[99:0] c;
    bcd_fadd fa(.a(a[3:0]),.b(b[3:0]),.cin(cin),.cout(c[0]),.sum(sum[3:0]));
    
    generate
        genvar i;
        for(i=1;i<100;i=i+1)begin: FA
            bcd_fadd fa(.a(a[4*i+3:i*4]),.b(b[4*i+3:i*4]),.cin(c[i-1]),.cout(c[i]),.sum(sum[i*4+3:i*4]));
            
            
        end
    endgenerate
    
    assign cout=c[99];
    
    
                
    

endmodule
