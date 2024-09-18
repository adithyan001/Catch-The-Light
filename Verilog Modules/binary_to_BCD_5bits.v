module binary_to_BCD_5bits(
    input [4:0] in,
    output [3:0] ones,tens
    );
wire [3:0] w1,w2;
add3 c1({1'b0,in[4:2]},w1);
add3 c2({w1[2:0],in[1]},w2);

assign ones = {w2[2:0],in[0]};
assign tens = {2'b00,w1[3],w2[3]};
endmodule
