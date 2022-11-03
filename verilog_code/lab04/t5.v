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
1. sub_test 里面的 output 位置错了;
2. 不能在 always 里面进行模块实例化。
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



