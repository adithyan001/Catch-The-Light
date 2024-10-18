`timescale 1ns / 1ps

module TestBench_clk_100hz();
    reg clk_in=0;
    wire clk_out;
    slow_clk dut(clk_in,clk_out);

    always
    #5 clk_in = ~clk_in;

endmodule
