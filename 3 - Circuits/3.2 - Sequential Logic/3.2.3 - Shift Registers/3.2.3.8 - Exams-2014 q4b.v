module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
);
    wire clk,E,L,w;
    
    assign clk = KEY[0];
    assign E = KEY[1];
    assign L = KEY[2];
    assign w = KEY[3];
    
    genvar i;
    generate
        for(i=3;i>=0;i--) begin : shift_regs
            MUXDFF tmp((i==3)?w:LEDR[i+1],LEDR[i],E,SW[i],L,clk,LEDR[i]);
        end
    endgenerate
endmodule

module MUXDFF (input w, input Q_prev, input E, input R, input L, input clk, 
               output Q);
    wire D;
    assign D = L?R:(E?w:Q_prev);
    
    always @(posedge clk) begin
        Q <= D;
    end
    
endmodule