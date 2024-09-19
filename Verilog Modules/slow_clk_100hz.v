module slow_clk(
    input rst,
    input clk_in,
    output reg clk_out
);
    reg[18:0] count;
    always@(posedge clk_in)
    if(rst)
        begin
            clk_out<=0;
            count<=0;
        end
    else
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
