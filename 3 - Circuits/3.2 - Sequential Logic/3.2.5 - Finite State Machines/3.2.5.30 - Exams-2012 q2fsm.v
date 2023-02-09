module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
    
    localparam A=3'd0,B=3'd1,C=3'd2,D=3'd3,E=3'd4,F=3'd5;
    
    reg [2:0] state;
    reg [2:0] next_state;
    
    always @(*) begin
        case(state)
            A: begin
                if(w) next_state = B;
                else next_state = A;
            end
            B: begin
                if(w) next_state = C;
                else next_state = D;
            end
            C: begin
                if(w) next_state = E;
                else next_state = D;
            end
            D: begin
                if(w) next_state = F;
                else next_state = A;
            end
            E: begin
                if(w) next_state = E;
                else next_state = D;
            end
            F: begin
                if(w) next_state = C;
                else next_state = D;
            end
            default: next_state = 'z;
        endcase
    end
    
    always @(posedge clk) begin
        if(reset) state <= A;
        else state <= next_state;
    end

    assign z = (state < E)? 1'b0 : 1'b1;
endmodule