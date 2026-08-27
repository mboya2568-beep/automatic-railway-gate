module railway_gate (
    input  wire clk,
    input  wire reset,
    input  wire train_sensor,
    output reg gate_open,
    output reg red_light,
    output reg green_light
);

    // Gate operation:
    // train_sensor = 1 -> Train detected -> Gate closes
    // train_sensor = 0 -> No train -> Gate opens

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            gate_open  <= 1'b1;
            red_light  <= 1'b0;
            green_light <= 1'b1;
        end
        else begin
            if (train_sensor) begin
                gate_open  <= 1'b0;
                red_light  <= 1'b1;
                green_light <= 1'b0;
            end
            else begin
                gate_open  <= 1'b1;
                red_light  <= 1'b0;
                green_light <= 1'b1;
            end
        end
    end

endmodule