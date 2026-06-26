`timescale 1ns / 1ps

module railway_gate(

    input clk,
    input reset,
    input sensor1,
    input sensor2,

    output reg gate,
    output reg red_led,
    output reg green_led,
    output reg buzzer

);

//==================================================
// State Declaration
//==================================================

parameter IDLE          = 2'b00;
parameter CLOSE_GATE    = 2'b01;
parameter TRAIN_PASSING = 2'b10;
parameter OPEN_GATE     = 2'b11;

reg [1:0] state;
reg [1:0] next_state;

//==================================================
// State Register
//==================================================

always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= IDLE;
    else
        state <= next_state;
end

//==================================================
// Next State Logic
//==================================================

always @(*)
begin

    case(state)

        IDLE:
        begin
            if(sensor1)
                next_state = CLOSE_GATE;
            else
                next_state = IDLE;
        end

        CLOSE_GATE:
        begin
            next_state = TRAIN_PASSING;
        end

        TRAIN_PASSING:
        begin
            if(sensor2)
                next_state = OPEN_GATE;
            else
                next_state = TRAIN_PASSING;
        end

        OPEN_GATE:
        begin
            next_state = IDLE;
        end

        default:
            next_state = IDLE;

    endcase

end

//==================================================
// Output Logic
//==================================================

always @(*)
begin

    case(state)

        IDLE:
        begin
            gate      = 1;
            green_led = 1;
            red_led   = 0;
            buzzer    = 0;
        end

        CLOSE_GATE:
        begin
            gate      = 0;
            green_led = 0;
            red_led   = 1;
            buzzer    = 1;
        end

        TRAIN_PASSING:
        begin
            gate      = 0;
            green_led = 0;
            red_led   = 1;
            buzzer    = 1;
        end

        OPEN_GATE:
        begin
            gate      = 1;
            green_led = 1;
            red_led   = 0;
            buzzer    = 0;
        end

        default:
        begin
            gate      = 1;
            green_led = 1;
            red_led   = 0;
            buzzer    = 0;
        end

    endcase

end

endmodule