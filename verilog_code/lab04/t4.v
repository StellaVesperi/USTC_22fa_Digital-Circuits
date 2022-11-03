/*
module sub_test (
input a,b,
output reg c
);
    assign c = (a < b) ? a : b;
endmodule

module test (
input a,b,c,
output o 
);
    reg temp;
    sub_test (.a(a), .b(b), temp);
    sub_test (temp, c, .c(o));
endmodule
*/

/*
errors:
1. 端口 c 用 assign 赋值，不应该是 reg 型;
2. 调用格式不规范，而且通过位置关联与通过时间关联混用;
3. temp 的类型也需要修改以统一。
*/

module sub_test (
input a,b,
output c
);
    assign c = (a < b) ? a : b;
endmodule

module test (
input a,b,c,
output o 
);
    wire temp;
    sub_test sub_test1 (.a(a), .b(b), .c(temp));
    sub_test sub_test2 (.a(temp), .b(c), .c(o));
endmodule