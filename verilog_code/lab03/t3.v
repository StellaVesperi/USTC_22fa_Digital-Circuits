module REG4( //���첽��λ�ļĴ�����ļ�����
    input CLK, CLR,
    output reg [3:0] counter
);
always @ (posedge CLK or posedge CLR)  
//��Ϊ�첽��λ�Ĵ�����CLR�Ǹߵ�ƽ��Ч��������or posedge CLR
begin
    if (CLR == 1)
        counter <= 4'b0;
    else 
        counter <= D_IN;
end
endmodule
