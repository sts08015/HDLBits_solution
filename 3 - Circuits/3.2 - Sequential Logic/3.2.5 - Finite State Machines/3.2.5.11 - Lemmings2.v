module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah );
    
    localparam LEFT = 2'd0, RIGHT = 2'd1, FALL_L = 2'd2, FALL_R = 2'd3;
    
    reg [1:0] state, next_state;
    
    always @(*) begin
        case(state)
            LEFT: begin
                if(!ground) next_state = FALL_L;
                else if(bump_left) next_state = RIGHT;
                else next_state = LEFT;
            end
            RIGHT: begin
                if(!ground) next_state = FALL_R;
                else if(bump_right) next_state = LEFT;
                else next_state = RIGHT;
            end
            FALL_L: begin
                if(ground) next_state = LEFT;
                else next_state = FALL_L;
            end
            FALL_R: begin
                if(ground) next_state = RIGHT;
                else next_state = FALL_R;
            end
        endcase
    end
    
    always @(posedge clk or posedge areset) begin
        if(areset) state <= LEFT;
        else if(clk) state <= next_state;
    end
    
    always @(*) begin
        case(state)
            LEFT: begin
                walk_left = 1'b1;
                walk_right = 1'b0;
                aaah = 1'b0;
            end
            RIGHT: begin
                walk_left = 1'b0;
                walk_right = 1'b1;
                aaah = 1'b0;
            end
            FALL_L: begin
                walk_left = 1'b0;
                walk_right = 1'b0;
                aaah = 1'b1;
            end
            FALL_R: begin
                walk_left = 1'b0;
                walk_right = 1'b0;
                aaah = 1'b1;
            end
        endcase
    end
	
endmodule