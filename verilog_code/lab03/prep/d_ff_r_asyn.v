//异步复位，不论时钟信号和D信号如何，一旦复位信号有效，Q就变成确定的复位值
module d_ff_r_asyn(
    input clk, rst_n, d,
    output reg q);
    always @ (postedge clk or negledge rst_n) //negledge rst_n 就是复位信号（低电平）有效
    begin 
        if (rst_n = 0)
            q <= 1'b0; //复位低电平，则输出也为0
        else
            q <= d; //否则输出为D
    end
endmodule

/*
说明： negedge 是与 posedge 同类型的一个关键字，
只不过它表示信号的下降沿事件。关键字“or”表示“或”操作.
*/
/*
当复位信号有效（低电平有效）时，输出信号 Q 始终为零.
这句话在同步异步中都一样，只不过同步必须有时钟信号上升沿的先决条件.
*/
