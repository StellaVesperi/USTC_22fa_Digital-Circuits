/*
module sub_test (
input a,b
);
output o;
assign o = a + b;
endmodule

module test (
input a,b,
output c
);
always @ (*)
begin
    sub_test sub_test(a, b, c);
end
endmodule
*/

/*
errors:
1. sub_test ����� output λ�ô���;
2. ������ always �������ģ��ʵ������
*/

module sub_test (
input a,b,
output o
);
assign o = a + b;
endmodule

module test (
input a,b,
output c
);
sub_test sub_test1 (a, b, c);
endmodule



