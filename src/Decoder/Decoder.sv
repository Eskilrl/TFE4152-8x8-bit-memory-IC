module Decoder (

//INPUTS

input[2:0] i_k_address,

//OUTPUTS

output[7:0] o_select

typedef enum logic[3:0] {
  cell_0,
  cell_1,
  cell_2,
  cell_3,
  cell_4,
  cell_5,
  cell_6,
  cell_7
} e_output_logic;

e_output_logic addr_select;

always_comb begin

addr_select = i_k_address;

case(addr_select)
  cell_0: o_select = 8'b00000001;
  cell_1: o_select = 8'b00000010;
  cell_2: o_select = 8'b00000100;
  cell_3: o_select = 8'b00001000;
  cell_4: o_select = 8'b00010000;
  cell_5: o_select = 8'b00100000;
  cell_6: o_select = 8'b01000000;
  cell_7: o_select = 8'b10000000;
  default: o_select = 8'b00000000;
endcase;

end;

endmodule
