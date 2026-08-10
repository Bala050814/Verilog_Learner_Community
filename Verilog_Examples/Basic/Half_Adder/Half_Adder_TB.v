`timescale 1ns/1ps

module half_adder_TB;
 reg a,b;
 wire sum,carry;
 half_adder ha(.a(a),.b(b),.sum(sum),.carry(carry));
 initial begin
    $dumpfile("half_adder.vcd");
    $dumpvars(0, half_adder_TB);
    $monitor("Time=%0t | A=%b B=%b | Sum=%b Carry=%b",$time, a, b, sum, carry);
    a=0;
    b=0;
    #5;

    a=0;
    b=1;
    #5;

    a=1;
    b=0;
    #5;

    a=1;
    b=1;
    #5;

    $finish;
 end
endmodule
