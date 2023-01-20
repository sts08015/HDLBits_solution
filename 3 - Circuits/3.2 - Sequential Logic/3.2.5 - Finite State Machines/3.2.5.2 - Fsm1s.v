// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
	parameter B=1'b0, A=1'b1;
    
    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            // Fill in reset logic
            present_state <= B;
            out <= 1'b1;
        end else begin
            case (present_state)
                // Fill in state transition logic
                B: begin
                    if(in == 1'b1) next_state = B;
                    else next_state = A;
                end
                A: begin
                    if(in == 1'b1) next_state = A;
                    else next_state = B;
                end
            endcase

            // State flip-flops
            present_state = next_state;   

            case (present_state)
                // Fill in output logic
                B:
                    out = 1'b1;
                A:
                    out = 1'b0;
            endcase
        end
    end

endmodule