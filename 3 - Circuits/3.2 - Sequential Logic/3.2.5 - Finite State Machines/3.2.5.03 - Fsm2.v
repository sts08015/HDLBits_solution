module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    localparam OFF=1'b0, ON=1'b1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            OFF: next_state = (j)?ON:OFF;
            ON: next_state = (k)?OFF:ON;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset) begin
            state <= OFF;
        end else begin
            state <= next_state;
        end
    end

    // Output logic
    assign out = (state == OFF)?1'b0:1'b1;

endmodule