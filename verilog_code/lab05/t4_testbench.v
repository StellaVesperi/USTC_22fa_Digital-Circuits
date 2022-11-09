module test_bench();
reg [3:0] A;
reg _E1, _E2, E3;
wire [7:0] _Y;
integer i = 0;
decoder decoder (.A(A), ._E1(_E1), ._E2(_E2), .E3(E3), ._Y(_Y));
initial begin
    _E1 = 1; _E2 = 1; E3 = 0; A = 3'h0; //使能无效，初始化 A 
    #10 _E1 = 0; _E2 = 1; E3 = 1; A = {$random} % 8; //使能无效，随机输入 A
    #10 _E1 = 1; _E2 = 0; E3 = 1; A = {$random} % 8; //使能无效，随机输入 A
    #10 _E1 = 0; _E2 = 0; E3 = 0; A = {$random} % 8; //使能无效，随机输入 A
    for (i = 0; i < 8; i = i + 1) begin
        #10 A = i;
    end
    #10 $stop;
end
endmodule