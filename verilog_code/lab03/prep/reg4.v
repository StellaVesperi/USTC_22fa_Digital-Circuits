//��4��D������������һ���ܴ��� 4bit ���ݵļĴ��������е͵�ƽ��Ч��ͬ����λ�ź�
module reg4(
    inout CLK, RST_N,
    input [3:0] D_IN,
    output reg [3:0] q);
    always @ (posedge CLK)
    begin 
        if (RST_N == 0)
            D_OUT <= 4'b0;
        else 
            D_OUT <= D_IN;
    end
endmodule

/*
˵�������ڶ� bit λ����źţ��� Verilog ��ʹ�á�[x:y]�����ַ�ʽ������
�������������У� D_OUT ����һ�� 4bit ���źţ��������� D_OUT[0]�� D_OUT[1]��
D_OUT[2]�� D_OUT[3]�ĸ��� bit �źš�
*/

//�����λֵ��Ϊ 0011�� ����Ӧ�ø�Ϊ���¡�
module reg4(
    inout CLK, RST_N,
    input [3:0] D_IN,
    output reg [3:0] q);
    always @ (posedge CLK)
    begin 
        if (RST_N == 0)
            D_OUT <= 4'b0011;
        else 
            D_OUT <= D_IN;
    end
endmodule