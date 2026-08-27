`timescale 1ns/1ps

module railway_gate_tb;

    reg clk;
    reg reset;
    reg train_sensor;

    wire gate_open;
    wire red_light;
    wire green_light;

    railway_gate uut (
        .clk(clk),
        .reset(reset),
        .train_sensor(train_sensor),
        .gate_open(gate_open),
        .red_light(red_light),
        .green_light(green_light)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;
        train_sensor = 0;

        #10;
        reset = 0;

        // No train detected
        train_sensor = 0;
        #20;

        // Train detected
        train_sensor = 1;
        #30;

        // Train passed
        train_sensor = 0;
        #20;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | Train=%b | Gate_Open=%b | Red=%b | Green=%b",
                 $time, train_sensor, gate_open, red_light, green_light);
    end

endmodule