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
    // Dump file for waveform (optional if using a waveform viewer)
    $dumpfile("Decoder_tb.vcd");
    $dumpvars(0, Decoder_tb);

    // Initialize inputs
    i_k_address = 3'b000;
    valid = 1'b0;
    
    // Apply all permutations of i_k_address and valid
    $display("Starting the test for Decoder");

    for (int i = 0; i < 8; i++) begin
      // Test for valid = 0 (no output should be selected)
      valid = 1'b0;
      i_k_address = i[2:0];
      #10;
      $display("Address: %b, Valid: %b, Output: %b", i_k_address, valid, o_select);

      // Test for valid = 1 (decoding happens)
      valid = 1'b1;
      #10;
      $display("Address: %b, Valid: %b, Output: %b", i_k_address, valid, o_select);
    end
    
    // End the test
    $finish;
  end

endmodule
