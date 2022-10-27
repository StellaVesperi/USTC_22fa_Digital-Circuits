module REG4( //用异步复位的触发器搭建的寄存器搭建的计数器
    input CLK, CLR,
    output reg [3:0] counter
);
always @ (posedge CLK or posedge CLR)  
//因为异步复位寄存器的CLR是高电平有效，所以用or posedge CLR
begin
    if (CLR == 1)
        counter <= 4'b0;
    else 
        counter <= counter + 4'b1;
end
endmodule
