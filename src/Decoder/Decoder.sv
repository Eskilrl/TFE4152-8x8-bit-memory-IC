module Decoder (

//INPUTS

input[2:0] i_k_address,
input valid,

//OUTPUTS

output[7:0] o_select

);

assign o_select[0] = !i_k_address[2]&&!i_k_address[1]&&!i_k_address[0]&&valid;
assign o_select[1] = !i_k_address[2]&&!i_k_address[1]&&i_k_address[0]&&valid;
assign o_select[2] = !i_k_address[2]&&i_k_address[1]&&!i_k_address[0]&&valid;
assign o_select[3] = !i_k_address[2]&&i_k_address[1]&&i_k_address[0]&&valid;
assign o_select[4] = i_k_address[2]&&!i_k_address[1]&&!i_k_address[0]&&valid;
assign o_select[5] = i_k_address[2]&&!i_k_address[1]&&i_k_address[0]&&valid;
assign o_select[6] = i_k_address[2]&&i_k_address[1]&&!i_k_address[0]&&valid;
assign o_select[7] = i_k_address[2]&&i_k_address[1]&&i_k_address[0]&&valid;

endmodule
