# 对于 实验03 里面的一些电路的说明

### 一些注意事项
- 注意，所有表明了 CLK 的输入都应该是时钟信号，但是因为要封装所以把有些换成了正常输入，如果要达成效果还是要换成时钟信号，不过因为后面有很多调用了封装的，所以记得搞完换回去。
- 换回去之后注意看看封装的端口位置有没有发生变化。
- 注意复位/ 置位信号的高低电平有效，按理来讲 clear 是复位， reset 是置位，但实验指导手册好像把他们混为一谈了。低电平有效就是输入 0 时产生复位/ 置位的效果，一般端口标为 `名字_N` 或者 `\名字` 。
- Logisim 里面提供的触发器下面三个端口干什么用的我还没搞明白，但是都是异步有效。

**以下部分对照 lab03 circuit 看。**  

### D 触发器
最基础的 D 触发器就是两个 D 锁存器构成，D 什么时候变化都没关系，在 CLK 上升沿的时候就会把这个变化传递到输出 Q。  
这种D触发器是没有复位信号的。

```
module d_ff(
    input clk, d,
    output reg q);
    always @ (posedge clk)
        q <= d;
endmodule
```

### D 触发器- 同步复位
同步复位的 D 触发器在上述触发器的基础上用给输入 D 多加了一个 \RST 分支，所以只有当 \RST 和 D 同时为 1 时才能有有效输入。  
这就意味着 D 和 \RST 必须同时在时钟上升沿取 1，才能使输出为 1. 如果在时钟上升沿 \RST 取了 0 ，有效，那么输出就变为 0. 
**一切操作都只在时钟上升沿的前提下进行。**  
先得有时钟上升沿->\RST 无效为1->才有输出= D.

```
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
```

### D 触发器- 异步复位
这个我直接用内置模块连了线搭的。这个里面 \RST 有很大决定权，它一旦有效（0），整个输出都重置成 0. 不受时钟信号影响，也不受输入影响。

```
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
```
