module tb_sig_detection;

    // Inputs
    reg B;              // Incoming signal
    reg clk;            // Clock signal
    reg [3:0] duration; // Duration parameter
    reg [3:0] delay;    // Delay parameter

    // Outputs
    wire signal;        // Signal output

    // Instantiate the sig_detection module
    sig_detection uut (
        .B(B),
        .clk(clk),
        .duration(duration),
        .delay(delay),
        .signal(signal)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Clock with a period of 10 time units
    end

    // Test stimulus
    initial begin
        // Initialize signals
        clk = 1;
        B = 0;
        duration = 4'b0001; // Example duration: 3 clock cycles
        delay = 4'b0011;    // Example delay: 3 clock cycles

        // Apply test cases
        #10 B = 1;  // Rising edge on B at time 10
        #10 B = 0;  // Falling edge on B at time 20
        #10 B = 1;  // Rising edge on B at time 30
        #20 B = 0;  // Falling edge on B at time 50
        #40 B = 1;
        #30 B = 0;
       

        // Observe the signal for the duration of the test
        #100;
        $stop; // Stop simulation
    end

endmodule
