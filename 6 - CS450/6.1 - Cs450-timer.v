module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);
    reg [9:0] counter;
    
    always @(posedge clk) begin
        if(load) counter <= data;
        else begin
            if(counter > 10'd0) counter -= 1'd1;
        end
    end
	
    assign tc = (counter == 10'd0);
endmodule