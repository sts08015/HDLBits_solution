module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    localparam SNT = 2'b00, WNT = 2'b01, WT = 2'b10, ST = 2'b11;
    
    reg [1:0] next_state;
    
    always @(*) begin
        if(train_valid) begin
            if(train_taken) begin
                if(state < ST) next_state = state + 1'b1;
                else next_state = state;
            end else begin
                if(state > SNT) next_state = state - 1'b1;
                else next_state = state;
            end
        end
        else next_state = state;
    end
    
    always @(posedge clk or posedge areset) begin
        if(areset) state <= WNT;
        else state <= next_state;
    end
    
endmodule