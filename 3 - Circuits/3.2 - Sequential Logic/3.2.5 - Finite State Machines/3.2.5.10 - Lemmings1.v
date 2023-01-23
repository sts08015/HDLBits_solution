module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    localparam LEFT=1'b0, RIGHT=1'b1;
    reg state, next_state;
    
    always @(*) begin
        case(state)
            LEFT: next_state = bump_left;
            RIGHT: next_state = ~bump_right;
        endcase
    end
    
    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset) state <= LEFT;
        else state <= next_state;
    end

    // Output logic
    assign walk_left = state == LEFT;
    assign walk_right = state == RIGHT;

endmodule