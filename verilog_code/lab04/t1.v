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
1. �ڷ� always ���������� if-else;
2. ���Ҫ�� if-else, ��Ҫ�� always �����ͬʱҪ�޸� b ������Ϊ reg.
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