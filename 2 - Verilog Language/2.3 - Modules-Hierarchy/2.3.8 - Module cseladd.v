module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] w1,w2,w3,w4;
    wire carry1,carry2,carry3;
    add16 lo(a[15:0],b[15:0],1'b0,w1,carry1);
    
    add16 hi1(a[31:16],b[31:16],1'b0,w2,carry2);
    add16 hi2(a[31:16],b[31:16],1'b1,w3,carry3);
    
    assign w4 = carry1?w3:w2;
    
    assign sum = {w4,w1};
    

endmodule
