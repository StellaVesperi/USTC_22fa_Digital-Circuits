//在时钟信号的上升沿才起作用的触发器的复位信号
// Called 同步复位
module d_ff_r_syn(
    input clk, rst_n, d,
    output reg q);
    always @ (posedge clk)
    begin
        if (rst_n == 0)
            q <= 1'b0;
        else 
            q <= d;
    end
endmodule

/*
说明：这段代码中又新出现了 begin、 end、 if、 else 四个关键字，
其中 begin/end必须成对出现，用于表征语句块的作用区间，
如上述例子中， begin/end 之间的代码都属于同一 always 块。 
if、 else 用于条件判断，在很多其它语言中都有出现，其含义也都一样，此处不再赘述。 
“1’b0”是一种数据表示方式，一般格式为“数据位宽’进制数值”，
本例中表示这是一个 1bit 的数据，用二进制表示，其值为 0。
*/
