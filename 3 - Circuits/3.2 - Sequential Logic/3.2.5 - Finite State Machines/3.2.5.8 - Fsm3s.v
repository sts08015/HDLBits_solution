module top_module(
    input clk,
    input in,
    input reset,
    output out); //
	
    localparam A=2'd0, B=2'd1, C=2'd2, D=2'd3;
    reg [1:0] state, next_state;
    // State transition logic
	always @(*) begin
        case(state)
            A: next_state = in?B:A;
            B: next_state = in?B:C;
            C: next_state = in?D:A;
            D: next_state = in?B:C;
        endcase
    end
    // State flip-flops with synchronous reset
    always @(posedge clk) begin
        if(reset) state <= A;
        else state <= next_state;
    end
    // Output logic
    assign out = &state;
endmodule