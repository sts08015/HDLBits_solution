module FF(input clk,d,output q);
    always @(posedge clk)
        q<=d;
endmodule

module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    generate
        genvar i;
        for(i=0;i<8;i++) begin: eightFF
            FF tmp(clk,d[i],q[i]);
        end
    endgenerate

endmodule
