`import "../FlipFlop/FlipFlop.sv"

module MemCell (
 input[7:0] i_m_input,
 input i_m_sel,
 input i_m_RW,

 output[7:0] o_m_output
);
  
BitCell BC_0(
 .i_sel(i_m_sel),
 .i_inp(i_m_input[0]),
 .i_wr(i_m_RW),
 .o_outp(o_m_output[0])
  );

BitCell BC_1(
 .i_sel(i_m_sel),
 .i_inp(i_m_input[1]),
 .i_wr(i_m_RW),
 .o_outp(o_m_output[1])
  );

BitCell BC_2(
 .i_sel(i_m_sel),
 .i_inp(i_m_input[2]),
 .i_wr(i_m_RW),
 .o_outp(o_m_output[2])
  );

BitCell BC_3(
 .i_sel(i_m_sel),
 .i_inp(i_m_input[3]),
 .i_wr(i_m_RW),
 .o_outp(o_m_output[3])
  );

BitCell BC_4(
 .i_sel(i_m_sel),
 .i_inp(i_m_input[4]),
 .i_wr(i_m_RW),
 .o_outp(o_m_output[4])
  );

BitCell BC_5(
 .i_sel(i_m_sel),
 .i_inp(i_m_input[5]),
 .i_wr(i_m_RW),
 .o_outp(o_m_output[5])
  );

BitCell BC_6(
 .i_sel(i_m_sel),
 .i_inp(i_m_input[6]),
 .i_wr(i_m_RW),
 .o_outp(o_m_output[6])
  );

BitCell BC_7(
 .i_sel(i_m_sel),
 .i_inp(i_m_input[7]),
 .i_wr(i_m_RW),
 .o_outp(o_m_output[7])
  );

  endmodule
