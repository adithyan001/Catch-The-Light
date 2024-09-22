module mux_4_1(
    input [1:0] sel,
    input [3:0]  i0,i1,i2,i3,
    output reg [3:0] y);

    always @(sel)
    begin
        case(sel)
            2'b00: y = i0;
            2'b01: y = i1;
            2'b10: y = i2;
            2'b11: y = i3;
            default: y = i0;
        endcase
    end
endmodule