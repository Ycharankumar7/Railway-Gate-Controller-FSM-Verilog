`timescale 1ns / 1ps

module railway_gate_tb;

reg clk;
reg reset;
reg sensor1;
reg sensor2;

wire gate;
wire red_led;
wire green_led;
wire buzzer;

//====================================
// Instantiate DUT
//====================================

railway_gate DUT(

    .clk(clk),
    .reset(reset),
    .sensor1(sensor1),
    .sensor2(sensor2),

    .gate(gate),
    .red_led(red_led),
    .green_led(green_led),
    .buzzer(buzzer)

);

//====================================
// Clock Generation
//====================================

always #5 clk = ~clk;

//====================================
// Test Sequence
//====================================

initial
begin

    clk = 0;
    reset = 1;
    sensor1 = 0;
    sensor2 = 0;

    #20;
    reset = 0;

    // -----------------------------
    // No Train
    // -----------------------------
    #20;

    // -----------------------------
    // Train Arrives
    // -----------------------------
    sensor1 = 1;

    #20;

    sensor1 = 0;

    // -----------------------------
    // Train Passing
    // -----------------------------
    #60;

    // -----------------------------
    // Train Leaves
    // -----------------------------
    sensor2 = 1;

    #20;

    sensor2 = 0;

    // -----------------------------
    // End Simulation
    // -----------------------------
    #50;

    $finish;

end

endmodule