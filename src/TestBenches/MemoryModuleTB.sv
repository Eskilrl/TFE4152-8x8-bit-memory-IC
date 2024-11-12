`timescale 1ns/1ps

module MemoryModule_tb;

  // Parameters for the testbench
  logic i0, i1, i2, i3, i4, i5, i6, i7;     // Input data signals
  logic adr0, adr1, adr2;                   // Address select signals
  logic op;                                 // Read/Write control signal
  logic select;                             // Select signal
  
  // Outputs from MemoryModule
  wire o0, o1, o2, o3, o4, o5, o6, o7;
  
  // Instantiate the MemoryModule
  MemoryModule uut (
    .i0(i0), .i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .i6(i6), .i7(i7),
    .adr0(adr0), .adr1(adr1), .adr2(adr2),
    .op(op), .select(select),
    .o0(o0), .o1(o1), .o2(o2), .o3(o3), .o4(o4), .o5(o5), .o6(o6), .o7(o7)
  );
  
  // Test process
  initial begin         
    // Initialize inputs to zero
    i0 = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0;
    adr0 = 0; adr1 = 0; adr2 = 0;
    op = 0;  // Initialize to read operation
    select = 0;
    
    // Wait 10 ns before starting tests
    #10;
    
    // First test: Write operation to address 000
    select = 1; op = 1; // Enable write operation
    i0 = 1; i1 = 0; i2 = 1; i3 = 0; i4 = 1; i5 = 0; i6 = 1; i7 = 0;  // Input data
    adr0 = 0; adr1 = 0; adr2 = 0;  // Address 000
    #10;

    // Second test: Write to address 001
    adr0 = 1; adr1 = 0; adr2 = 0;  // Address 001
    #10;
    
    // Third test: Write to address 010
    adr0 = 0; adr1 = 1; adr2 = 0;  // Address 010
    #10;

    // Fourth test: Write to address 011
    adr0 = 1; adr1 = 1; adr2 = 0;  // Address 011
    #10;

    // Switch to Read Operation
    op = 0;  // Read operation
    select = 0; // Disable write

    // Read from address 000
    adr0 = 0; adr1 = 0; adr2 = 0;
    #10;

    // Read from address 001
    adr0 = 1; adr1 = 0; adr2 = 0;
    #10;

    // Read from address 010
    adr0 = 0; adr1 = 1; adr2 = 0;
    #10;

    // Read from address 011
    adr0 = 1; adr1 = 1; adr2 = 0;
    #10;

    // End simulation
    $finish;
  end

endmodule
