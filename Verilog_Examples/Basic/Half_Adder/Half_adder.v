module half_adder(input a,input b,output sum,output carry);  // a --> is one of the Input  b--> is the Other input
//sum is the XOR of the two inputs 
assign sum=a^b; 
// carry is the AND of the two inputs 
assign carry=a&b;
endmodule 
// View the Readme file for Explanation 
