`import "../FlipFlop/FlipFlop.sv"

module MemCell (
 input[7:0] i_m_input,
 input i_m_sel,
 input i_m_RW,

 output[7:0] o_m_output
);
  
FlipFlop BC_0(
 .i_sel(i_m_sel),
 .i_inp(i_m_input[0]),
 .i_wr(i_m_RW),
 .o_outp(o_m_output[0])
  );

FlipFlop BC_1(
 .i_sel(i_m_sel),
 .i_inp(i_m_input[1]),
 .i_wr(i_m_RW),
 .o_outp(o_m_output[1])
  );

FlipFlop BC_2(
 .i_sel(i_m_sel),
 .i_inp(i_m_input[2]),
 .i_wr(i_m_RW)
 .o_outp(o_m_output[2])
  );

FlipFlop BC_3(
 .i_sel(i_m_sel),
 .i_inp(i_m_input[3]),
 .i_wr(i_m_RW),
 .o_outp(o_m_output[3])
  );

FlipFlop BC_4(
 .i_sel(i_m_sel),
 .i_inp(i_m_input[4]),
 .i_wr(i_m_RW),
 .o_outp(o_m_output[4])
  );

FlipFlop BC_5(
 .i_sel(i_m_sel),
 .i_inp(i_m_input[5]),
 .i_wr(i_m_RW),
 .o_outp(o_m_output[5])
  );

FlipFlop BC_6(
 .i_sel(i_m_sel),
 .i_inp(i_m_input[6]),
 .i_wr(i_m_RW),
 .o_outp(o_m_output[6])
  );

FlipFlop BC_7(
 .i_sel(i_m_sel),
 .i_inp(i_m_input[7]),
 .i_wr(i_m_RW),
 .o_outp(o_m_output[7])
  );

  endmodule
