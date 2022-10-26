module t2(
    input clk, D, rst, rst_n, // rst_n �����Ƿ���λ��rst ������λΪ0����1
    output reg q   
);
    wire temp1, temp2;
    select select1 (.d0(0), .d1(1), .s(rst), .out(temp1));
    select select2 (.d0(D), .d1(temp1), .s(rst_n), .out(temp2));
    always @ (posedge clk)
        begin
            q <= temp2;
        end
endmodule

module select (  //��ѡһѡ����ģ��
    input d0, d1, s,
    output out
);
    wire carry0, carry1, carry2;
    not (s, carry0);
    and (d0, carry0);
    and (s, d1);
    or (carry1, carry2);
endmodule    