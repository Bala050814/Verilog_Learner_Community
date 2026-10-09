`timescale 1ns / 1ps

module mux8to1_TB;

    // Inputs to the Design Under Test (DUT)
    reg [7:0] a;
    reg [2:0] sel;

    // Outputs from the Design Under Test (DUT)
    wire out;

    // Instantiate the 8-to-1 Multiplexer
    mux8to1 uut (
        .a(a),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Initialize Inputs
        a = 8'b10101010; // Pattern: a=1, a=0, a=1, a=0, a=1, a=0, a=1, a=0
        sel = 3'b000;

        // Monitor changes in console
        $monitor("Time = %0dns | Input a = %b | Select sel = %b (%0d) | Output out = %b", $time, a, sel, sel, out);

        // Test all 8 select configurations
        #10 sel = 3'b000; // Should select a (0)
        #10 sel = 3'b001; // Should select a (1)
        #10 sel = 3'b010; // Should select a (0)
        #10 sel = 3'b011; // Should select a (1)
        #10 sel = 3'b100; // Should select a (0)
        #10 sel = 3'b101; // Should select a (1)
        #10 sel = 3'b110; // Should select a (0)
        #10 sel = 3'b111; // Should select a (1)

        // Change input pattern to test alternate states
        #10 a = 8'b01010101;
        sel = 3'b000; // Should select new a (1)
        #10 sel = 3'b111; // Should select new a (0)

        #10 $finish;
    end

endmodule
