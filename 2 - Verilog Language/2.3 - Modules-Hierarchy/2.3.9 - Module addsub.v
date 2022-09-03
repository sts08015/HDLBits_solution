module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [15:0] w1,w2;
    wire carry1,carry2;
    
    add16 lo(a[15:0],b[15:0]^{16{sub}},sub,w1,carry1);
    add16 hi(a[31:16],b[31:16]^{16{sub}},carry1,w2,carry2);
    
    assign sum = {w2,w1};
endmodule
