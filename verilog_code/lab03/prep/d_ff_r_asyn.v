//�첽��λ������ʱ���źź�D�ź���Σ�һ����λ�ź���Ч��Q�ͱ��ȷ���ĸ�λֵ
module d_ff_r_asyn(
    input clk, rst_n, d,
    output reg q);
    always @ (postedge clk or negledge rst_n) //negledge rst_n ���Ǹ�λ�źţ��͵�ƽ����Ч
    begin 
        if (rst_n = 0)
            q <= 1'b0; //��λ�͵�ƽ�������ҲΪ0
        else
            q <= d; //�������ΪD
    end
endmodule

/*
˵���� negedge ���� posedge ͬ���͵�һ���ؼ��֣�
ֻ��������ʾ�źŵ��½����¼����ؼ��֡�or����ʾ���򡱲���.
*/
/*
����λ�ź���Ч���͵�ƽ��Ч��ʱ������ź� Q ʼ��Ϊ��.
��仰��ͬ���첽�ж�һ����ֻ����ͬ��������ʱ���ź������ص��Ⱦ�����.
*/
