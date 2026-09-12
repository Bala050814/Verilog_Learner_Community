`timescale 1ns/1ps

module mux8to1_TB;
reg [7:0] a;
reg [2:0] sel;
wire out;

mux8to1 m1(a,sel,out);
initial begin
    $dumpfile("mux8to1_TB.vcd");
    $dumpvars(0,mux8to1_TB);


    a=8'b01010101;
    sel=3'b000;
    #10;

    a=8'b01010101;
    sel=3'b001;
    #10;


    a=8'b01010101;
    sel=3'b010;
    #10;

    a=8'b01010101;
    sel=3'b011;
    #10;

    a=8'b01010101;
    sel=3'b100;
    #10;

    a=8'b01010101;
    sel=3'b101;
    #10;

    a=8'b01010101;
    sel=3'b110;
    #10;

    a=8'b01010101;
    sel=3'b111;
    #10;

    a=8'b11111111;
    sel=3'b000;
    #10;

    a=8'b11111111;
    sel=3'b001;
    #10;


    a=8'b11111111;
    sel=3'b010;
    #10;

    a=8'b11111111;
    sel=3'b011;
    #10;

    a=8'b11111111;
    sel=3'b100;
    #10;

    a=8'b11111111;
    sel=3'b101;
    #10;


    a=8'b11111111;
    sel=3'b110;
    #10;


    a=8'b11111111;
    sel=3'b111; 
    #10;

    a=8'b00000000;
    sel=3'b000;
    #10;

    a=8'b00000000;
    sel=3'b001;
    #10;

    a=8'b00000000;
    sel=3'b010;
    #10;

    a=8'b00000000;
    sel=3'b011;
    #10;

    a=8'b00000000;
    sel=3'b100;
    #10;
    
    a=8'b00000000;
    sel=3'b101;
    #10;
    
    a=8'b00000000;
    sel=3'b110;
    #10;


    a=8'b00000000;
    sel=3'b111;
    #10;


    $finish;

end

endmodule


