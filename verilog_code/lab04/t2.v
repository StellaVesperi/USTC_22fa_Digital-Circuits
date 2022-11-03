/*
填空题。
1. 由赋值语句可看出 b 也是 4bit;
2. 由 always 语句块得知 b 的类型应该是 reg.
*/

module t2 (
input [4:0] a,
output reg [4:0] b
);
always @ (*)
    b = a;
endmodule