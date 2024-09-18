
module catch_the_light(
    input clk,clk_1sec,rst,time_up,
    input[15:0] switches,
    output reg[15:0] led,
    output [3:0] score_ones,score_tens

);
    parameter // SCORES
    x0  = 8'b0000_0000,
    x1  = 8'b0000_0001,
    x2  = 8'b0000_0010,
    x3  = 8'b0000_0011,
    x4  = 8'b0000_0100,
    x5  = 8'b0000_0101,
    x6  = 8'b0000_0110,
    x7  = 8'b0000_0111,
    x8  = 8'b0000_1000,
    x9  = 8'b0000_1001,
    x10 = 8'b0001_0000,
    x11 = 8'b0001_0001,
    x12 = 8'b0001_0010,
    x13 = 8'b0001_0011,
    x14 = 8'b0001_0100,
    x15 = 8'b0001_0101,
    x16 = 8'b0001_0110,
    x17 = 8'b0001_0111,
    x18 = 8'b0001_1000,
    x19 = 8'b0001_1001,
    x20 = 8'b0010_0000,
    x21 = 8'b0010_0001,
    x22 = 8'b0010_0010,
    x23 = 8'b0010_0011,
    x24 = 8'b0010_0100,
    x25 = 8'b0010_0101,
    x26 = 8'b0010_0110,
    x27 = 8'b0010_0111,
    x28 = 8'b0010_1000,
    x29 = 8'b0010_1001,
    x30 = 8'b0011_0000,
    x31 = 8'b0011_0001,
    x32 = 8'b0011_0010,
    x33 = 8'b0011_0011,
    x34 = 8'b0011_0100,
    x35 = 8'b0011_0101,
    x36 = 8'b0011_0110,
    x37 = 8'b0011_0111,
    x38 = 8'b0011_1000,
    x39 = 8'b0011_1001,
    x40 = 8'b0100_0000,
    x41 = 8'b0100_0001,
    x42 = 8'b0100_0010,
    x43 = 8'b0100_0011,
    x44 = 8'b0100_0100,
    x45 = 8'b0100_0101,
    x46 = 8'b0100_0110,
    x47 = 8'b0100_0111,
    x48 = 8'b0100_1000,
    x49 = 8'b0100_1001,
    x50 = 8'b0101_0000;


    parameter // STATES
    s0  = 6'b000000,
    s1  = 6'b000001,
    s2  = 6'b000010,
    s3  = 6'b000011,
    s4  = 6'b000100,
    s5  = 6'b000101,
    s6  = 6'b000110,
    s7  = 6'b000111,
    s8  = 6'b001000,
    s9  = 6'b001001,
    s10 = 6'b001010,
    s11 = 6'b001011,
    s12 = 6'b001100,
    s13 = 6'b001101,
    s14 = 6'b001110,
    s15 = 6'b001111,
    s16 = 6'b010000,
    s17 = 6'b010001,
    s18 = 6'b010010,
    s19 = 6'b010011,
    s20 = 6'b010100,
    s21 = 6'b010101,
    s22 = 6'b010110,
    s23 = 6'b010111,
    s24 = 6'b011000,
    s25 = 6'b011001,
    s26 = 6'b011010,
    s27 = 6'b011011,
    s28 = 6'b011100,
    s29 = 6'b011101,
    s30 = 6'b011110,
    s31 = 6'b011111,
    s32 = 6'b100000,
    s33 = 6'b100001,
    s34 = 6'b100010,
    s35 = 6'b100011,
    s36 = 6'b100100,
    s37 = 6'b100101,
    s38 = 6'b100110,
    s39 = 6'b100111,
    s40 = 6'b101000,
    s41 = 6'b101001,
    s42 = 6'b101010,
    s43 = 6'b101011,
    s44 = 6'b101100,
    s45 = 6'b101101,
    s46 = 6'b101110,
    s47 = 6'b101111,
    s48 = 6'b110000,
    s49 = 6'b110001,
    s50 = 6'b110010;


    reg[5:0] current_state,next_state;
    reg[7:0] score;
    reg finished;

    assign score_ones = score[3:0];
    assign score_tens = score[7:4];

    always@(posedge clk)
    if(rst)
        begin
            current_state <= s0;
            score <= x0;
            finished <= 1'b0;
            led <= 16'h0000;
        end
    else if((time_up==1'b1)||(finished==1'b1))
        begin
            if(clk_1sec)
                led <= 16'h0000;
            else
                led <= 16'hffff;
        end
    else
        current_state <= next_state;




    always @ (current_state, switches)
    begin
        case(current_state)
            s0:
            begin
                score <= x0;
                led[2] <= 1'b1;
                if(switches == led)
                    next_state <= s1;
                else
                    next_state <= s0;
            end

            s1:
            begin
                score <= x1;
                led[5] <= 1'b1;
                if(switches == led)
                    next_state <= s2;
                else
                    next_state <= s1;
            end

            s2:
            begin
                score <= x2;
                led[8] <= 1'b1;
                if(switches == led)
                    next_state <= s3;
                else
                    next_state <= s2;
            end

            s3:
            begin
                score <= x3;
                led[11] <= 1'b1;
                if(switches == led)
                    next_state <= s4;
                else
                    next_state <= s3;
            end

            s4:
            begin
                score <= x4;
                led[1] <= 1'b1;
                if(switches == led)
                    next_state <= s5;
                else
                    next_state <= s4;
            end

            s5:
            begin
                score <= x5;
                led[3] <= 1'b1;
                if(switches == led)
                    next_state <= s6;
                else
                    next_state <= s5;
            end

            s6:
            begin
                score <= x6;
                led[7] <= 1'b1;
                if(switches == led)
                    next_state <= s7;
                else
                    next_state <= s6;
            end

            s7:
            begin
                score <= x7;
                led[9] <= 1'b1;
                if(switches == led)
                    next_state <= s8;
                else
                    next_state <= s7;
            end

            s8:
            begin
                score <= x8;
                led[5] <= 1'b0;
                if(switches == led)
                    next_state <= s9;
                else
                    next_state <= s8;
            end

            s9:
            begin
                score <= x9;
                led[11] <= 1'b0;
                if(switches == led)
                    next_state <= s10;
                else
                    next_state <= s9;
            end

            s10:
            begin
                score <= x10;
                led[1] <= 1'b0;
                if(switches == led)
                    next_state <= s11;
                else
                    next_state <= s10;
            end

            s11:
            begin
                score <= x11;
                led[0] <= 1'b1;
                if(switches == led)
                    next_state <= s12;
                else
                    next_state <= s11;
            end

            s12:
            begin
                score <= x12;
                led[4] <= 1'b1;
                if(switches == led)
                    next_state <= s13;
                else
                    next_state <= s12;
            end

            s13:
            begin
                score <= x13;
                led[13] <= 1'b1;
                if(switches == led)
                    next_state <= s14;
                else
                    next_state <= s13;
            end

            s14:
            begin
                score <= x14;
                led[6] <= 1'b1;
                if(switches == led)
                    next_state <= s15;
                else
                    next_state <= s14;
            end

            s15:
            begin
                score <= x15;
                led[8] <= 1'b0;
                if(switches == led)
                    next_state <= s16;
                else
                    next_state <= s15;
            end

            s16:
            begin
                score <= x16;
                led[10] <= 1'b1;
                if(switches == led)
                    next_state <= s17;
                else
                    next_state <= s16;
            end

            s17:
            begin
                score <= x17;
                led[12] <= 1'b1;
                if(switches == led)
                    next_state <= s18;
                else
                    next_state <= s17;
            end

            s18:
            begin
                score <= x18;
                led[3] <= 1'b0;
                if(switches == led)
                    next_state <= s19;
                else
                    next_state <= s18;
            end

            s19:
            begin
                score <= x19;
                led[15] <= 1'b1;
                if(switches == led)
                    next_state <= s20;
                else
                    next_state <= s19;
            end

            s20:
            begin
                score <= x20;
                led[7] <= 1'b0;
                if(switches == led)
                    next_state <= s21;
                else
                    next_state <= s20;
            end

            s21: 
            begin
                score <= x21;
                led[14] <= 1'b1;
                if(switches == led)
                    next_state <= s22;
                else
                    next_state <= s21;
            end

            s22:
            begin
                score <= x22;
                led[7] <= 1'b1;
                if(switches == led)
                    next_state <= s23;
                else
                    next_state <= s22;
            end

            s23:
            begin
                score <= x23;
                led[4] <= 1'b0;
                if(switches == led)
                    next_state <= s24;
                else
                    next_state <= s23;
            end

            s24:
            begin
                score <= x24;
                led[14] <= 1'b0;
                if(switches == led)
                    next_state <= s25;
                else
                    next_state <= s24;
            end

            s25:
            begin
                score <= x25;
                led[5] <= 1'b1;
                if(switches == led)
                    next_state <= s26;
                else
                    next_state <= s25;
            end

            s26:
            begin
                score <= x26;
                led[1] <= 1'b1;
                if(switches == led)
                    next_state <= s27;
                else
                    next_state <= s26;
            end

            s27:
            begin
                score <= x27;
                led[0] <= 1'b0;
                if(switches == led)
                    next_state <= s28;
                else
                    next_state <= s27;
            end

            s28:
            begin
                score <= x28;
                led[10] <= 1'b0;
                if(switches == led)
                    next_state <= s29;
                else
                    next_state <= s28;
            end

            s29:
            begin
                score <= x29;
                led[9] <= 1'b0;
                if(switches == led)
                    next_state <= s30;
                else
                    next_state <= s29;
            end

            s30:
            begin
                score <= x30;
                led[3] <= 1'b1;
                if(switches == led)
                    next_state <= s31;
                else
                    next_state <= s30;
            end

            s31:
            begin
                score <= x31;
                led[1] <= 1'b0;
                if(switches == led)
                    next_state <= s32;
                else
                    next_state <= s31;
            end

            s32:
            begin
                score <= x32;
                led[15] <= 1'b0;
                if(switches == led)
                    next_state <= s33;
                else
                    next_state <= s32;
            end

            s33:
            begin
                score <= x33;
                led[14] <= 1'b1;
                if(switches == led)
                    next_state <= s34;
                else
                    next_state <= s33;
            end

            s34:
            begin
                score <= x34;
                led[8] <= 1'b1;
                if(switches == led)
                    next_state <= s35;
                else
                    next_state <= s34;
            end

            s35:
            begin
                score <= x35;
                led[2] <= 1'b0;
                if(switches == led)
                    next_state <= s36;
                else
                    next_state <= s35;
            end

            s36:
            begin
                score <= x36;
                led[6] <= 1'b0;
                if(switches == led)
                    next_state <= s37;
                else
                    next_state <= s36;
            end

            s37:
            begin
                score <= x37;
                led[0] <= 1'b1;
                if(switches == led)
                    next_state <= s38;
                else
                    next_state <= s37;
            end

            s38:
            begin
                score <= x38;
                led[15] <= 1'b1;
                if(switches == led)
                    next_state <= s39;
                else
                    next_state <= s38;
            end

            s39:
            begin
                score <= x39;
                led[1] <= 1'b1;
                if(switches == led)
                    next_state <= s40;
                else
                    next_state <= s39;
            end

            s40:
            begin
                score <= x40;
                led[14] <= 1'b0;
                if(switches == led)
                    next_state <= s41;
                else
                    next_state <= s40;
            end

            s41:
            begin
                score <= x41;
                led[2] <= 1'b1;
                if(switches == led)
                    next_state <= s42;
                else
                    next_state <= s41;
            end

            s42:
            begin
                score <= x42;
                led[6] <= 1'b1;
                if(switches == led)
                    next_state <= s43;
                else
                    next_state <= s42;
            end

            s43:
            begin
                score <= x43;
                led[5] <= 1'b0;
                if(switches == led)
                    next_state <= s44;
                else
                    next_state <= s43;
            end

            s44:
            begin
                score <= x44;
                led[3] <= 1'b0;
                if(switches == led)
                    next_state <= s45;
                else
                    next_state <= s44;
            end

            s45:
            begin
                score <= x45;
                led[7] <= 1'b0;
                if(switches == led)
                    next_state <= s46;
                else
                    next_state <= s45;
            end

            s46:
            begin
                score <= x46;
                led[9] <= 1'b1;
                if(switches == led)
                    next_state <= s47;
                else
                    next_state <= s46;
            end

            s47:
            begin
                score <= x47;
                led[11] <= 1'b1;
                if(switches == led)
                    next_state <= s48;
                else
                    next_state <= s47;
            end

            s48:
            begin
                score <= x48;
                led[13] <= 1'b0;
                if(switches == led)
                    next_state <= s49;
                else
                    next_state <= s48;
            end

            s49:
            begin
                score <= x49;
                led[6] <= 1'b0;
                if(switches == led)
                    next_state <= s50;
                else
                    next_state <= s49;
            end

            s50:
            begin
                score <= x50;
                finished <= 1'b1;

            end
        endcase


    end

endmodule
