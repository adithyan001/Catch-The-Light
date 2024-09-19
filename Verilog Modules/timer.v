module timer(
    input rst,clk,
    output [4:0] count,
    output reg time_up
);
    parameter timer_limit = 20;
    reg [4:0] timer_count;

    assign count = timer_count;

    always@(posedge clk)
    if(rst)
        begin
            timer_count<= timer_limit;
            time_up <= 1'b0;
        end
    else if(timer_count == 0)
        begin
            time_up <= 1'b1;
            timer_count<=timer_count;
        end
    else if(timer_count>=1)
        begin
            timer_count<=timer_count-1;
            if(timer_count == 1)
                time_up <= 1'b1;
            else
                time_up <= 1'b0;
        end
    else
        timer_count<=timer_count;



endmodule
