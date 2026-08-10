`timescale 1ns/1ps

module one_bit_buffer_tb;
wire out;
reg in;

one_bit_buffer u1(.in(in),.out(out));
initial begin
    $dumpfile("one_bit_buffer_tb.vcd");
    $dumpvars(0,one_bit_buffer_tb);
    $monitor("time=%0t in=%b out=%b",$time,in,out);

    in=0;
    #10;
    in=0;
    #10;
    in=1;
    #10;
    in=0;
    #10;
    in=0;
    #10;
    in=1;
    #10;
    in=0;
    #10;
    in=0;
    #10;
    in=1;
    #10;
    in=0;
    #10;
    in=0;
    #10;
    in=1;
    #10;
    in=0;
    #10;
    in=0;
    #10;
    in=1;
    #10;
    in=0;
    #10;
    in=0;
    #10;
    in=1;
    #10;

    $finish;
end
endmodule
