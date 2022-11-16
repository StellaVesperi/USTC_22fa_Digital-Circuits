module calculator (
    input clk, rst,
    output [7:0] cout
);
reg [31:0] Q;
always @(posedge clk or posedge rst)
begin 
    if (rst == 1) Q <= Q + 32'b0;
    else Q <= Q + 32'b1;
end
assign cout = Q[31:24];
endmodule