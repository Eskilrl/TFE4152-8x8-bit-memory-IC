`timescale 1ns/1ps

module MemoryModule_tb;

  // Parameters for the testbench
  logic i0, i1, i2, i3, i4, i5, i6, i7;     // Input data signals
  logic adr0, adr1, adr2;                   // Address select signals
  reg op;                                 // Read/Write control signal
  reg select;                             // Select signal
  reg i_clk = 0;
  // Outputs from MemoryModule
  wire o0, o1, o2, o3, o4, o5, o6, o7;
  
  // Instantiate the MemoryModule
  MemoryModule uut (
    .i0(i0), .i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .i6(i6), .i7(i7),
    .adr0(adr0), .adr1(adr1), .adr2(adr2),
    .op(op), .select(select),	 
	.i_clk(i_clk),
    .o0(o0), .o1(o1), .o2(o2), .o3(o3), .o4(o4), .o5(o5), .o6(o6), .o7(o7)
  );
  always begin
	  #5;
	  i_clk = ~i_clk;
end
  
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
    //i0 = 1; i1 = 0; i2 = 1; i3 = 0; i4 = 1; i5 = 0; i6 = 1; i7 = 0;  // Input data 
	{i7,i6,i5,i4,i3,i2,i1,i0} = 8'h4D; 
	{adr2, adr1, adr0} = 3'b100; //Address 4
    #20;

    // Second test: Write to address 001	
	{i7,i6,i5,i4,i3,i2,i1,i0} = 8'h48;	  
	{adr2, adr1, adr0} = 3'b111; //Address 7
    #20;
	
	
    // Third test: Write to address 010	 
	{i7,i6,i5,i4,i3,i2,i1,i0} = 8'h45;	
	{adr2, adr1, adr0} = 3'b110; //Address 6
    #20;
	
	{i7,i6,i5,i4,i3,i2,i1,i0} = 8'h52;
    // Fourth test: Write to address 011	
	{adr2, adr1, adr0} = 3'b000; //Address 0
    #20; 
	
	{i7,i6,i5,i4,i3,i2,i1,i0} = 8'h4C;
    // Fourth test: Write to address 011	
	{adr2, adr1, adr0} = 3'b001; //Address 1
    #20;

    // Switch to Read Operation
    op = 0;  // Read operation
    select = 0; // Disable write   
	#20

    // Read from address 4	
	op=0;
	select = 1;
    {adr2, adr1, adr0} = 3'b100; //Address 4
    #20;

    // Read from address 7
    {adr2, adr1, adr0} = 3'b111; //Address 7
    #20;

    // Read from address 6
    {adr2, adr1, adr0} = 3'b110; //Address 6
    #20;

    // Read from address 0
    {adr2, adr1, adr0} = 3'b000; //Address 0
    #20;	
	
	// Read from address 1
	{adr2, adr1, adr0} = 3'b001; //Address 1

    // End simulation
    $finish;
  end

endmodule