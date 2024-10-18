module slow_clk_1hz(
    input clk_in,
    output reg clk_out
);
    reg[25:0] count = 0;
    always@(posedge clk_in)
    begin
        if(count==49999999)
            begin
                count<=0;
                clk_out<=~clk_out;
            end
        else
            count<=count+1;
    end

endmodule
