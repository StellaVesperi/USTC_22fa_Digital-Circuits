module d_ff(
    input clk, d,
    output reg q);
    always @ (posedge clk)
        q <= d;
endmodule

/*说明： reg、 always 和 posedge 是 Verilog 中的关键字， 其中 always 表示其后是个过程语句块。
reg 与前面学习到的 wire 关键字类似，是一种数据类型，称为寄存器类型。
对于初学者，可以简单的理解为凡是在 always 语句块内被赋值的信号，都应定义为 reg 类型。 
posedge 为事件控制关键字， 例如代码中的“posedge clk”表示“clk 信号的上升沿”这一事件。
另外，在时序逻辑电路中，信号赋值采用“<=”（非阻塞赋值） ,而不是“=”（阻塞赋值）， 
这两种赋值方式的区别暂不介绍，读者只需记住一个原则：组合逻辑采用阻塞赋值“=”，时序逻辑采用非阻塞赋值“<=” 。
*/
