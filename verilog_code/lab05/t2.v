module test_bench2();
    reg clk, RST_N, D;
    // 以下两行在第三题中有用
    // wire o;
    // d_ff_r d_ff_r (.clk(clk), .rst_n(RST_N), .d(D), .q(o));
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        RST_N = 0; D = 0;
        #12.5 D = 1;
        #15 RST_N = 1;
        #10 D = 0;
        #17.5 $stop;
    end
endmodule