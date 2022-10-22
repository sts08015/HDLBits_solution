module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z );
    
    reg [7:0] Q;
    wire [2:0] addr;
    assign addr = {A,B,C};
    assign Z = Q[addr];
    
    always @(posedge clk) begin
        if(enable == 1'b1) begin
            Q[7:1] <= Q[6:0];
            Q[0] <= S;
        end
    end

endmodule