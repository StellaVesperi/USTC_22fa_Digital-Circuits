module t1 (
    input clk,rst,
    output led
);
    reg [1:0] cnt;
    reg [1:0] cntnextstate;
    always@(*)
    begin
        cntnextstate=cnt+2'b1;
    end
    always@(posedge clk or posedge rst)
    begin
        if(rst)cnt<=2'b0;
        else cnt<=cntnextstate;
    end
    assign led=(cnt==2'b11)?1'b1:1'b0;
endmodule

/* the original:
module test(
input clk,rst,
output led);
reg [1:0] cnt;
always@(posedge clk or posedge rst_n)
begin
    if(rst)
        cnt <= 2'b0;
    else
        cnt <= cnt + 1'b1;
end
assign led = (cnt==2'b11) ? 1'b1 : 1'b0;
endmodule
*/