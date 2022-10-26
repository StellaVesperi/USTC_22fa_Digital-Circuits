//用4个D触发器构成了一个能储存 4bit 数据的寄存器，带有低电平有效的同步复位信号
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
说明：对于多 bit 位宽的信号，在 Verilog 中使用“[x:y]”这种方式声明，
例如上述代码中， D_OUT 就是一个 4bit 的信号，它包含了 D_OUT[0]、 D_OUT[1]、
D_OUT[2]、 D_OUT[3]四个单 bit 信号。
*/

//如果复位值改为 0011， 代码应该改为如下。
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