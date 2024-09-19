`timescale 1ns / 1ps

module TestBench_timer();
    reg rst;
    reg clk_in=0;
    wire [4:0] count;
    wire time_up;
    timer dut(rst,clk_in,count,time_up);

    always
    #5 clk_in = ~clk_in;

    initial
    begin
        rst=1;
        #13 rst = 0;
    end

endmodule
