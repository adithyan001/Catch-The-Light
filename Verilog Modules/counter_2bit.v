module counter_2bit(
    input clk, reset,
    output[1:0] count
);
    reg [1:0] counter_up;
    
    assign count = counter_up;

    always @(posedge clk)
    begin
        if(reset)
            counter_up <= 2'b00;
        else
            counter_up <= counter_up + 1;
    end
    
endmodule