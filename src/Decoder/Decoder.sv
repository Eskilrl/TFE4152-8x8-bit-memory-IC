module Decoder (

//INPUTS

input[2:0] i_k_address,
input valid,

//OUTPUTS

output[7:0] o_select

);

wire inverted_address0;
wire inverted_address1;
wire inverted_address2;

NOT(inverted_address0, i_k_address[0]);
NOT(inverted_address1, i_k_address[1]);
NOT(inverted_address2, i_k_address[2]);

AND(o_select[0], inverted_address2, inverted_address1, inverted_address0);
AND(o_select[1], inverted_address2, inverted_address1, i_k_address[0]);
AND(o_select[2], inverted_address2, i_k_address[1], inverted_address0);
AND(o_select[3], inverted_address2, i_k_address[1], i_k_address[0]);
AND(o_select[4], i_k_address[2], inverted_address1, inverted_address0);
AND(o_select[5], i_k_address[2], inverted_address1, i_k_address[0]);
AND(o_select[6], i_k_address[2], i_k_address[1], inverted_address0);
AND(o_select[7], i_k_address[2], i_k_address[1], i_k_address[0]);

endmodule
