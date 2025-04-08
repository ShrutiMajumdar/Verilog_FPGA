module div_detection (
    input B,          // Incoming signal
    input clk,        // FPGA clock
    input [3:0] divide,
    output reg [3:0] signal,
    output divider_signal

);

    reg BB;
    reg [3:0] counter;
    wire enA; 

initial counter = 0;
initial signal = 0;

    // Edge detection logic
    always @(posedge clk) begin
        BB <= B; // Store the previous value of B
    end
    assign enA = !BB && B;
    always @(posedge clk) begin
        if (enA) begin 
            if (counter == (divide -1)) begin
                signal <= B; 
                counter <= 0; 
            end else begin
                signal <= 0; 
                counter <= counter + 1;
            end
        end else begin
            signal <= 0; 
        end
    end

assign divider_signal = signal;

endmodule
