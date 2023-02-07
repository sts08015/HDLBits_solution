module counter(input clk, input activate, output danger);
    
    reg [4:0] clocks;
    
    always @(posedge clk) begin
        if(!activate) clocks = 5'd0;
        else if(clocks < 5'd20) clocks = clocks + 1'b1;
    end
       
    assign danger = (clocks>=20);
endmodule


module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging );
    
    localparam LEFT = 3'd0, RIGHT = 3'd1, FALL_L = 3'd2, FALL_R = 3'd3, DIG_L = 3'd4, DIG_R = 3'd5, DIE = 3'd6;
    
    reg [2:0] state, next_state;
    reg danger;
    wire activate;
    
    assign activate = (state == FALL_L || state == FALL_R);
    counter cnt (clk,activate,danger);
    
    always @(*) begin
        case(state)
            LEFT: begin
                if(!ground) next_state = FALL_L;
                else if(dig) next_state = DIG_L;
                else if(bump_left) next_state = RIGHT;
                else next_state = LEFT;
            end
            RIGHT: begin
                if(!ground) next_state = FALL_R;
                else if(dig) next_state = DIG_R;
                else if(bump_right) next_state = LEFT;
                else next_state = RIGHT;
            end
            FALL_L: begin
                if(danger && ground) next_state = DIE;
                else if(ground) next_state = LEFT;
                else next_state = FALL_L;
            end
            FALL_R: begin
                if(danger && ground) next_state = DIE;
                else if(ground) next_state = RIGHT;
                else next_state = FALL_R;
            end
            DIG_L: begin
                if(!ground) next_state = FALL_L;
                else next_state = DIG_L;
            end
            DIG_R: begin
                if(!ground) next_state = FALL_R;
                else next_state = DIG_R;
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
                digging = 1'b0;
            end
            RIGHT: begin
                walk_left = 1'b0;
                walk_right = 1'b1;
                aaah = 1'b0;
                digging = 1'b0;
            end
            FALL_L: begin
                walk_left = 1'b0;
                walk_right = 1'b0;
                aaah = 1'b1;
                digging = 1'b0;
            end
            FALL_R: begin
                walk_left = 1'b0;
                walk_right = 1'b0;
                aaah = 1'b1;
                digging = 1'b0;
            end
            DIG_L: begin
                walk_left = 1'b0;
                walk_right = 1'b0;
                aaah = 1'b0;
                digging = 1'b1;
            end
            DIG_R: begin
                walk_left = 1'b0;
                walk_right = 1'b0;
                aaah = 1'b0;
                digging = 1'b1;
            end
            DIE: begin
                walk_left = 1'b0;
                walk_right = 1'b0;
                aaah = 1'b0;
                digging = 1'b0;
            end
        endcase
    end

endmodule