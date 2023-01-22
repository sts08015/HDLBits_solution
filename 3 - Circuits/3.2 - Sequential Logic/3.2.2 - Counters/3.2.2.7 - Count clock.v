module decade_counter (
    input clk,
    input reset,        // Synchronous active-high reset
    input ena,
    input load,
    input [3:0] d,
    output reg [3:0] q);
    
    always @(posedge clk) begin
        if(reset) q<=4'd0;
        else if(load) q<=d;
        else if(ena) q<=(q+1)%4'd10;
    end
    
    //`probe(d);
    //`probe(q);
endmodule


module sixty_counter(
    input clk,
    input reset,
    input ena,
    output carry,
    output [7:0] q);
    
    wire [1:0] en;
    
    assign en[0] = ena;
    assign en[1] = (q[3:0] == 4'd9) & ena;
    
    assign carry = q == {4'd5,4'd9} & ena;
    wire reset_sixty = reset | carry;
    
    decade_counter sixty_tmp0(clk,reset_sixty,en[0],1'b0,4'd0,q[3:0]);
    decade_counter sixty_tmp1(clk,reset_sixty,en[1],1'b0,4'd0,q[7:4]);
    
    //`probe(reset_sixty);
    //`probe(q);
    
endmodule

module twelve_counter(
    input clk,
    input reset,
    input ena,
    output carry,
    output [7:0] q);
    
    wire [1:0] en;
    
    assign en[0] = ena;
    assign en[1] = (q[3:0] == 4'd9) & ena;
    assign carry = q=={4'd1,4'd2} & ena;
    wire load = reset | carry;
    
    wire [3:0] set[2];
    assign set[0] = reset?4'd2:4'd1;
    assign set[1] = reset?4'd1:4'd0;
    
    decade_counter twelve_tmp0(clk,1'b0,en[0],load,set[0],q[3:0]);
    decade_counter twleve_tmp1(clk,1'b0,en[1],load,set[1],q[7:4]);
    
    //`probe(load);
    //`probe(q);
    
    
endmodule

module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
    wire [2:0] carry;
    
    
    always @(posedge clk) begin
        if(reset) pm <= 1'b0;
        else if(hh == {4'd1,4'd1} & mm == {4'd5,4'd9} & ss == {4'd5,4'd9}) pm <= ~pm;
    end
    
    sixty_counter seconds(clk,reset,ena,carry[0],ss);
    sixty_counter minutes(clk,reset,ena & carry[0],carry[1],mm);
    twelve_counter hours(clk,reset,ena & carry[1],carry[2],hh);
    
    //`probe(ss);
    //`probe(mm);
    //`probe(hh);
    
endmodule