`timescale 1ns / 1ps

module Decoder_tb;

  // Inputs
  reg [2:0] i_k_address;
  reg valid;

  // Outputs
  wire [7:0] o_select;

  // Instantiate the Unit Under Test (UUT)
  Decoder uut (
    .i_k_address(i_k_address),
    .valid(valid),
    .o_select(o_select)
  );

  // Procedure to apply stimulus
  initial begin 
    i_k_address = 3'b000;
    valid = 1'b0;
        for (int i = 0; i < 8; i++) begin
      // Test for valid = 0 (no output should be selected)
      valid = 1'b0;
      i_k_address = i[2:0];
      #10;
          // Test for valid = 1 (decoding happens)
      valid = 1'b1;
      #10;
    end
    
    // End the test
    $finish;
  end

endmodule
