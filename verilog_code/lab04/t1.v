/*
module t1 (
    input a,
    output b
);
    if (a) b = 1'b0;
    else b = 1'b1;
endmodule
*/

/* 
errors:
1. 在非 always 语句块里面用 if-else;
2. 如果要用 if-else, 需要在 always 语句块里，同时要修改 b 的类型为 reg.
*/

module t1 (
    input a,
    output reg b
);
    always @ (*)
    begin
        if (a) b = 1'b0;
        else b = 1'b1;
    end
endmodule