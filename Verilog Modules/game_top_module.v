module game_top_module(
    input clk,reset,
    input [15:0] sw,
    output [15:0] led,
    output [3:0] display_sel,
    output [0:6] display_val
);

wire clk_100hz,clk_1hz;
wire [4:0] timer_count;
wire timer_time_up;
wire [3:0] timer_ones,timer_tens,score_ones,score_tens;
wire[1:0] display_count;
wire [3:0] mux_out;

slow_clk_100hz b1(reset,clk,clk_100hz);
slow_clk_1hz b2(reset,clk,clk_1hz);
timer b3(reset,clk_1hz,timer_count,timer_time_up);
binary_to_BCD_5bits b4(timer_count,timer_ones,timer_tens);
catch_the_light b5(clk,clk_1hz,reset,timer_time_up,sw,led,score_ones,score_tens);
counter_2bit b6(clk_100hz,reset,display_count);
mux_4_1 b7(display_count,timer_ones,timer_tens,score_ones,score_tens,mux_out);
decoder_2_4 b8(display_count,display_sel);
controller_7seg b9(mux_out,display_val);

endmodule
