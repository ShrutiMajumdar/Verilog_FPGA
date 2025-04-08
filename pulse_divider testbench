`timescale 1ns / 1ps

module div_detection_tb;

    reg B;
    reg clk;
    reg [3:0] divide;
    wire signal;
    wire divider_signal;

    div_detection uut (
        .B(B),
        .clk(clk),
        .divide(divide),
        .signal(signal),
        .divider_signal(divider_signal)
    );

    initial begin
        clk = 0;
        divide = 3; // Pass every 3rd pulse
        B = 0;

        #10;

        // Apply a series of pulses
        repeat (10) begin
            #20; B = 1; #20; B = 0;
        end

//        divide = 3; // Now pass every 4th pulse
//        repeat (3) begin
//            #20; B = 1; #10; B = 0;
//        end

        #50 $finish;
    end

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%t, clk=%b, B=%b, divide=%d, counter=%d, signal=%b, divider_signal=%b",
                 $time, clk, B, divide, uut.counter, signal, divider_signal);
    end

endmodule
