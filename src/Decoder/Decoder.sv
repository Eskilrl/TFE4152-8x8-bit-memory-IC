module Decoder (

//INPUTS

input[2:0] i_k_address,
input valid,

//OUTPUTS

output[7:0] o_select

);

//Inverted address interconnects
wire inverted_address0;
wire inverted_address1;
wire inverted_address2;

not(inverted_address0, i_k_address[0]);
not(inverted_address1, i_k_address[1]);
not(inverted_address2, i_k_address[2]);

//Combinaorial logic for decoder functionality
and(o_select[0], valid, inverted_address2, inverted_address1, inverted_address0);
and(o_select[1], valid, inverted_address2, inverted_address1, i_k_address[0]);
and(o_select[2], valid, inverted_address2, i_k_address[1],    inverted_address0);
and(o_select[3], valid, inverted_address2, i_k_address[1],    i_k_address[0]);
and(o_select[4], valid, i_k_address[2],    inverted_address1, inverted_address0);
and(o_select[5], valid, i_k_address[2],    inverted_address1, i_k_address[0]);
and(o_select[6], valid, i_k_address[2],    i_k_address[1],    inverted_address0);
and(o_select[7], valid, i_k_address[2],    i_k_address[1],    i_k_address[0]);  

endmodule
