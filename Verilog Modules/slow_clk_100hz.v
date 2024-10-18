module slow_clk_100hz(
    input clk_in,
    output reg clk_out
);
    reg[18:0] count=0;
    always@(posedge clk_in)
    begin
        if(count==499999)
            begin
                count<=0;
                clk_out<=~clk_out;
            end
        else
            count<=count+1;
    end

endmodule
