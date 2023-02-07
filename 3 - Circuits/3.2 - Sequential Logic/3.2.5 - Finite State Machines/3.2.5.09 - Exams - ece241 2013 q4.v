module top_module (
	input clk,
	input reset,
	input [3:1] s,
	output fr3,
	output fr2,
	output fr1,
	output dfr
);

	localparam A=3'd0, B1=3'd1, B2=3'd2, C1=3'd3, C2=3'd4, D=3'd5;
    reg [2:0] state, next_state;
	
	always @(posedge clk) begin
		if (reset) state <= A;
		else state <= next_state;
	end
    
	always@(*) begin
		case (state)
			A: next_state = s[1] ? B1 : A;
			B1: next_state = s[2] ? C1 : (s[1] ? B1 : A);
			B2: next_state = s[2] ? C1 : (s[1] ? B2 : A);
			C1: next_state = s[3] ? D : (s[2] ? C1 : B2);
			C2: next_state = s[3] ? D : (s[2] ? C2 : B2);
			D: next_state = s[3] ? D : C2;
			default: next_state = 'x;
		endcase
	end
    
	always@(*) begin
		case (state)
			A: {fr3, fr2, fr1, dfr} = 4'b1111;
			B1: {fr3, fr2, fr1, dfr} = 4'b0110;
			B2: {fr3, fr2, fr1, dfr} = 4'b0111;
			C1: {fr3, fr2, fr1, dfr} = 4'b0010;
			C2: {fr3, fr2, fr1, dfr} = 4'b0011;
			D: {fr3, fr2, fr1, dfr} = 4'b0000;
			default: {fr3, fr2, fr1, dfr} = 'x;
		endcase
	end
	
endmodule