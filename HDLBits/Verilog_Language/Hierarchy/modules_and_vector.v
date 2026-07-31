module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output reg [7:0] q 
);
    wire [7:0] q1,q2,q3;
    my_dff8 fl1(.d(d),.clk(clk),.q(q1));
    my_dff8 fl2(.d(q1),.clk(clk),.q(q2));
    my_dff8 fl3(.d(q2),.clk(clk),.q(q3));
    
    
    always @(*)
        begin
        case(sel)
                2'b00: q=d;
                2'b01: q=q1;
                2'b10:q=q2;
                2'b11:q=q3;  
        endcase
        end
         
 
            

endmodule
