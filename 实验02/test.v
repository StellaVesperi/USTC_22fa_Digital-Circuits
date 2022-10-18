module test(
    input in,
    output out,
    output put_n);
    
    assign out = in;
    assign out_n = ~in;
endmodule
