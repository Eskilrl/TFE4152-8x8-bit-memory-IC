`timescale 1ns/1ps

module BitCell_tb;

  // Inputs
  reg i_sel;
  reg i_inp;
  reg i_wr;

  // Output
  wire o_outp;

  // Instantiate the BitCell module
  BitCell uut (
    .i_sel(i_sel),
    .i_inp(i_inp),
    .i_wr(i_wr),
    .o_outp(o_outp)
  );

  // Test each permutation
  initial begin
    // Iterate over all combinations of i_sel, i_inp, and i_wr
    for (int sel = 0; sel < 2; sel++) begin
      for (int inp = 0; inp < 2; inp++) begin
        for (int wr = 0; wr < 2; wr++) begin
          i_sel = sel;
          i_inp = inp;
          i_wr  = wr;
          #10;  // Wait for 10 ns to allow signals to propagate
       end
      end
    end
   // Finish simulation
    $finish;
  end

endmodule
