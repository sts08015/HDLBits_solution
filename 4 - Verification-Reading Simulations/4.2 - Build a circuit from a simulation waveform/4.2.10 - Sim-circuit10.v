module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
	
    localparam A=1'b0, B=1'b1;
    
    always @(posedge clk) begin
        case(state)
            A: if(a&b) state <= B;
            B: if(~(a|b)) state <= A;
        endcase
    end
    
    assign q = a^b^state;
    
endmodule


/*
//better solution
module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    
    always @(posedge clk) begin
        if (a == b)
            state <= a;
    end
    
    assign q = a^b^state;

endmodule
*/