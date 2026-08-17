module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    
    
    fulladder in(.a(a[0]),.b(b[0]),.cin(cin),.cout(cout[0]),.sum(sum[0]));
    generate 
        genvar i;
        for(i=1;i<100;i=i+1)begin : FA
            fulladder in(.a(a[i]),.b(b[i]),.cin(cout[i-1]),.sum(sum[i]),.cout(cout[i]));
        end
    endgenerate

endmodule

            
module fulladder(input a,input b,input cin,output sum,output cout);
                assign {cout,sum}=a+b+cin;
endmodule
