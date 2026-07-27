module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
	wire ip1,ip2,ip3,ip4;
    assign ip1=p1a&p1c&p1b;
    assign ip2=p1f&p1e&p1d;
    assign ip3=p2a&p2b;
    assign ip4=p2c&p2d;
    
    assign p1y=ip1|ip2;
    assign p2y=ip3| ip4;
    

endmodule
