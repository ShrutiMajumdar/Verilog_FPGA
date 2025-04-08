module sig_detection (
    input B,                // Incoming signal
    input clk,              // FPGA clock
    input [3:0] duration,   
    output OUT  
     
);


    reg BB;                   
    reg [3:0] counter;
    wire enA;               


initial counter =0;
    // Edge detection logic
    always @(posedge clk) begin
        BB <= B;  // Store the previous value of B
    end

    assign enA = !BB && B;  // Rising edge of B: when previous state was 0 and current is 1

always @(posedge clk) begin
        if (enA && counter == 0)
            counter <= 1; 
        else if(counter > 0)
            counter <= counter + 1;
        if(counter >= duration)
            counter <= 0;
    end

    assign OUT = (counter > 0);
 

endmodule
