module controller_7seg(
    input [3:0] BCD_in,
    output reg [0:6] disp
);

    parameter
    ZERO = 7'b000_0001,
    ONE = 7'b100_1111,
    TWO = 7'b001_0010,
    THREE = 7'b000_0110,
    FOUR = 7'b100_1100,
    FIVE = 7'b010_0100,
    SIX = 7'b010_0000,
    SEVEN = 7'b000_1111,
    EIGHT = 7'b000_0000,
    NINE = 7'b000_0100;

    always@(BCD_in)
    case(BCD_in)
        4'b0000 : disp = ZERO;
        4'b0001 : disp = ONE;
        4'b0010 : disp = TWO;
        4'b0011 : disp = THREE;
        4'b0100 : disp = FOUR;
        4'b0101 : disp = FIVE;
        4'b0110 : disp = SIX;
        4'b0111 : disp = SEVEN;
        4'b1000 : disp = EIGHT;
        4'b1001 : disp = NINE;
    endcase

endmodule
