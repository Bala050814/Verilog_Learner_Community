`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    
    
    wire ip1,ip2;
    assign ip1=a&b;
    assign ip2=c&d;
    assign out=ip1|ip2;
    assign out_n=~(ip1|ip2);

endmodule
