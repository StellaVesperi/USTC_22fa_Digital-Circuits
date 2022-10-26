module cycle_adder(
    input CLK, RST_N,
    output reg [3:0] CNT);
    always @ (posedge CLK)
    begin 
        if (RST_N == 0)
            CNT <= 4'b0;
        else 
            CNT <= CNT + 4'b1;
    end
endmodule