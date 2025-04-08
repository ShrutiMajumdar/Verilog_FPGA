`timescale 1ns / 1ps

module sig_detection_tb;

    // Inputs
    reg B;
    reg clk;
    reg [3:0] duration;

    // Output
    wire OUT;


    // Instantiate the Unit Under Test (UUT)
    sig_detection uut (
        .B(B),
        .clk(clk),
        .duration(duration),
        .OUT(OUT)
     
    );

    // Clock generation
    initial begin
        clk = 1;
        forever #5 clk = ~clk; // Period of 10ns (5ns high, 5ns low)
    end

    // Stimulus generation
    initial begin
        // Initialize inputs
        B = 0;
        duration = 3;

        // Test case 1: Basic rising edge detection and duration
        #10;
        B = 1;
        #10;
        B = 0;
        #30; // Test duration = 3

        // Test case 2: Another rising edge with the same duration
        #20;
        B = 1;
        #50;
        B = 0;
        #30;

        // Test case 3: Change duration to 5
        duration = 5;
        #20;
        B = 1;
        #10;
        B = 0;
        #60; // Test duration = 5

        // Test case 4: Change duration to 1
        duration = 6;
        #20;
        B = 1;
        #10;
        B = 0;
        #20; // Test duration = 1

        // Test case 5: back to 3
//        duration = 3;
//        #20;
        B = 1;
        #10;
        B = 0;
        #30;

        #300 $finish; // End simulation
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t, B=%b, clk=%b, duration=%0d, counter=%0d, OUT=%b",
                 $time, B, clk, duration, uut.counter, OUT);
    end

endmodule
