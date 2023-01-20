module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=1'b0, B=1'b1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        if(state == B) begin
            if(in == 1'b1) begin
                next_state = B;
            end else begin
                next_state = A;
            end
        end else begin
            if(in == 1'b1) begin
                next_state = A;
            end else begin
                next_state = B;
            end
        end
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if(areset) begin
            state <= B;
        end else if(clk) begin
            state <= next_state;
        end
    end

    // Output logic
    assign out = (state == A)?1'b0:1'b1;
endmodule