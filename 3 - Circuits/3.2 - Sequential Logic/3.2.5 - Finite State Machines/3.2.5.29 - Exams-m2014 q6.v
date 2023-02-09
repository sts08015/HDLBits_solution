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
                if(w) next_state = A;
                else next_state = B;
            end
            B: begin
                if(w) next_state = D;
                else next_state = C;
            end
            C: begin
                if(w) next_state = D;
                else next_state = E;
            end
            D: begin
                if(w) next_state = A;
                else next_state = F;
            end
            E: begin
                if(w) next_state = D;
                else next_state = E;
            end
            F: begin
                if(w) next_state = D;
                else next_state = C;
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