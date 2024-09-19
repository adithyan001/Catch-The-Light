`timescale 1ns / 1ps

module TestBench_bin2bcd_5bit();

    reg [4:0] in=0;
    wire [3:0] ones,tens;
    integer i;
    binary_to_BCD_5bits dut(in,ones,tens);

    initial
    begin

        $monitor("%0d%0d",tens,ones);
        for(i=0;i<32;i=i+1)
            #5 in = in +1;

        $finish;
    end

endmodule
