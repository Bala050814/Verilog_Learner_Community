module mux81_tb;

reg  [7:0] a;
reg  [2:0] sel;
wire       out;

integer i;
integer errors;

mux8to1 m1 (
    .a(a),
    .sel(sel),
    .out(out)
);

initial begin
    $dumpfile("mux81_tb.vcd");
    $dumpvars(0, mux81_tb);

    errors = 0;

    // Test 1: Alternating pattern
    
    a = 8'b01010101;

    for (i = 0; i < 8; i = i + 1) begin
        sel = i;
        #10;

        if (out !== a[sel]) begin
            $display("FAIL: a=%b sel=%b expected=%b got=%b",
                     a, sel, a[sel], out);
            errors = errors + 1;
        end
        else begin
            $display("PASS: a=%b sel=%b out=%b",
                     a, sel, out);
        end
    end

    // Test 2: All ones
    a = 8'b11111111;

    for (i = 0; i < 8; i = i + 1) begin
        sel = i;
        #10;

        if (out !== a[sel]) begin
            $display("FAIL: a=%b sel=%b expected=%b got=%b",
                     a, sel, a[sel], out);
            errors = errors + 1;
        end
        else begin
            $display("PASS: a=%b sel=%b out=%b",
                     a, sel, out);
        end
    end

    // Test 3: All zeros
    a = 8'b00000000;

    for (i = 0; i < 8; i = i + 1) begin
        sel = i;
        #10;

        if (out !== a[sel]) begin
            $display("FAIL: a=%b sel=%b expected=%b got=%b",
                     a, sel, a[sel], out);
            errors = errors + 1;
        end
        else begin
            $display("PASS: a=%b sel=%b out=%b",
                     a, sel, out);
        end
    end

    // Test 4: Opposite alternating pattern
    a = 8'b10101010;

    for (i = 0; i < 8; i = i + 1) begin
        sel = i;
        #10;

        if (out !== a[sel]) begin
            $display("FAIL: a=%b sel=%b expected=%b got=%b",
                     a, sel, a[sel], out);
            errors = errors + 1;
        end
        else begin
            $display("PASS: a=%b sel=%b out=%b",
                     a, sel, out);
        end
    end

    // Final result
    if (errors == 0)
        $display("ALL TESTS PASSED");
    else
        $display("TEST FAILED: %0d errors", errors);

    $finish;
end

endmodule
