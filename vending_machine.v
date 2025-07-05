`timescale 1ns / 1ps
module vending_machine(
    input clk,
    input rst,
    input [1:0] in,    // 01 = 5$, 10 = 10$
    output reg out,    // Product delivered
    output reg [1:0] change // 01 = 5$ change, 10 = 10$ change
    );

    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;

    reg [1:0] c_state, n_state;

    // State register
    always @ (posedge clk or posedge rst)
    begin
        if (rst)
            c_state <= s0;
        else
            c_state <= n_state;
    end

    // Next state & output logic
    always @ (*)
    begin
        // Default outputs
        out = 0;
        change = 2'b00;
        case (c_state)
            s0: begin
                case (in)
                    2'b00: begin n_state = s0; end
                    2'b01: begin n_state = s1; end
                    2'b10: begin n_state = s2; end
                    default: n_state = s0;
                endcase
            end

            s1: begin
                case (in)
                    2'b00: begin n_state = s0; change = 2'b01; end
                    2'b01: begin n_state = s2; end
                    2'b10: begin n_state = s2; out = 1; end
                    default: n_state = s0;
                endcase
            end

            s2: begin
                case (in)
                    2'b00: begin n_state = s0; change = 2'b10; end
                    2'b01: begin n_state = s0; out = 1; end
                    2'b10: begin n_state = s0; out = 1; change = 2'b01; end
                    default: n_state = s0;
                endcase
            end

            default: n_state = s0;
        endcase
    end
endmodule
