// Behavioral module of a multiplexer with two data inputs and one selection input
// Mux 2: 1 where 2 ^ n are the data inputs and n is the select input

`ifndef MUX2_1_CONDUCTUAL
`define MUX2_1_CONDUCTUAL

// In order to understand the bits bits [3: 0] equals 4 bits and [1: 0] 2 bits
module mux21 (
// The inputs are defined
input clk,
input reset_L,
input selector,
input [1:0] data_in0,
input [1:0] data_in1,
// The outputs are defined
output reg [1:0] data_out
);

reg [1:0] cable_conexion;



// Always @ (*) is used because it is recommended for
// create a combinational block (combinational logic), when no memory is required in the block -
// no flops. The always @ (*) allows to avoid fleas

always @(*)
// block initial
    begin

        if(selector == 0) begin
          cable_conexion = data_in0;
        end // end if

        else begin
            if (selector == 1)begin
              cable_conexion = data_in1;
            end // end if
        end // end else begin

    end // end begin if

// Defining reset for Flip Flops
// In order to define flip flops: this being a two-state (bi-stable) device, which serves as
// basic memory for sequential logic operations.
// For input 0 and 1 - output
always @ (posedge clk) begin

    if (reset_L == 1) begin
         data_out <= cable_conexion;
    end // end if

      else begin
          if (reset_L == 0) begin
          data_out <= 0;
          end // end if
      end //end else begin

 end // end begin if

endmodule

`endif
