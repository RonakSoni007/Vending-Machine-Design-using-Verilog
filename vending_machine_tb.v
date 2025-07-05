`timescale 1ns / 1ps

module vending_machine_tb;

    // Inputs
    reg clk;
    reg rst;
    reg [1:0] in;

    // Outputs
    wire out;
    wire [1:0] change;

    // Instantiate the Unit Under Test (UUT)
    vending_machine uut (
        .clk(clk), 
        .rst(rst), 
        .in(in), 
        .out(out), 
        .change(change)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        in = 2'b00;

        // Wait for reset
        #10;
        rst = 0;

        // Test sequence:
        // Insert 5 -> Insert 5 -> Dispense
        #10 in = 2'b01;  // +5
        #10 in = 2'b01;  // +5 -> should dispense
        #10 in = 2'b00;  // no coin

        // Insert 10 -> Dispense
        #10 in = 2'b10;  // +10 -> should dispense
        #10 in = 2'b00;

        // Insert 5 -> Insert 10 -> Dispense + Change
        #10 in = 2'b01;  // +5
        #10 in = 2'b10;  // +10 -> should dispense, no change in your logic
        #10 in = 2'b00;

        // Insert 10 -> Insert 10 -> should dispense + 5 change
        #10 in = 2'b10;
        #10 in = 2'b10;
        #10 in = 2'b00;

        // Reset machine
        #10 rst = 1;
        #10 rst = 0;

        // Finish
        #50 $finish;
    end
      
endmodule
