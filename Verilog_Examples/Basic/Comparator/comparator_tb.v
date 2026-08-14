module comparator_tb;

reg a, b;
wire equal, aless, agreat;

comparator uut(a, b, equal, aless, agreat);

initial begin

    a = 1;
    b = 0;
    #10;

    a = 1;
    b = 1;
    #10;

    a = 0;
    b = 1;
    #10;

    a = 0;
    b = 0;
    #10;

    $finish;

end

endmodule