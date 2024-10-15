`timescale 1ns/1ps

module MemCell_tb;

  // Testbench signals
  logic [7:0] i_m_input;  // 8-bit input data
  logic i_m_sel;          // Select signal
  logic i_m_RW;           // Read/Write signal (1 for Write, 0 for Read)
  
  wire [7:0] o_m_output;  // 8-bit output data
  
  // Instantiate the MemCell module
  MemCell uut (
    .i_m_input(i_m_input),
    .i_m_sel(i_m_sel),
    .i_m_RW(i_m_RW),
    .o_m_output(o_m_output)
  );
  
  // Test process
  initial begin
    // Monitor the changes in signals
    $monitor("Time: %0t | i_m_input=%b | i_m_sel=%b | i_m_RW=%b | o_m_output=%b", 
              $time, i_m_input, i_m_sel, i_m_RW, o_m_output);

    // Initialize the inputs
    i_m_input = 8'b00000000;
    i_m_sel = 0; // Deselected initially
    i_m_RW = 0;  // Read operation by default

    #10; // Wait for 10 time units
    
    // Test Case 1: Write operation, i_m_sel=1 (Select the cell)
    i_m_input = 8'b10101010;  // Writing a pattern
    i_m_sel = 1;  // Select the MemCell
    i_m_RW = 1;   // Set to write operation
    #10;
    
    // Test Case 2: Deselect the cell, no write should happen
    i_m_sel = 0;  // Deselect the MemCell
    i_m_input = 8'b11110000;  // New pattern, should not be written
    #10;

    // Test Case 3: Read the stored value, should output previous written value
    i_m_sel = 1;  // Select the MemCell
    i_m_RW = 0;   // Set to read operation
    #10;
    
    // Test Case 4: Write a new value with i_m_sel = 1
    i_m_input = 8'b11001100;  // New pattern to write
    i_m_sel = 1;  // Select the MemCell
    i_m_RW = 1;   // Set to write operation
    #10;

    // Test Case 5: Read the newly written value
    i_m_RW = 0;  // Set to read operation
    #10;

    // End the simulation
    $finish;
  end
  
endmodule
