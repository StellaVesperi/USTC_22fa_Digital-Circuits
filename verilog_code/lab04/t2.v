/*
����⡣
1. �ɸ�ֵ���ɿ��� b Ҳ�� 4bit;
2. �� always �����֪ b ������Ӧ���� reg.
*/

module t2 (
input [4:0] a,
output reg [4:0] b
);
always @ (*)
    b = a;
endmodule