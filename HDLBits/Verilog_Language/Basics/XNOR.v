module top_module( 
    input a, 
    input b, 
    output out );

  assign out=~(a^b); // out=a~^b can also be used 
endmodule
