module calculator (
    input clk, rst,
    output [7:0] cout
);
reg [29:0] Q;
always @(posedge clk or posedge rst)
begin 
    if (rst == 1) Q <= Q + 30'b0;
    else Q <= Q + 30'b1;
end
assign cout = Q[29:22];
endmodule