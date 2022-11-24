module t1 (
    input [3:0] a,
    output [7:0] spo
);
    dist_mem_gen_0 dist_mem_gen_0(
        .a(a),
        .spo(spo)
    );
endmodule