module FloatDiv
#(
	parameter N 	= 	40,
	parameter M 	= 	9,
	parameter FP_DW = 	32
)
(
//	input logic clk,
//	input logic rst_n,
//	input logic div_op_en,
	input logic [FP_DW-1:0] div_rb,
	input logic [FP_DW-1:0] div_rc,
	output logic [FP_DW-1:0] div_ra
//	output logic div_luf_clr,
//	output logic div_lvf_clr,
//	output logic div_luf_flag,
//	output logic div_lvf_flag
);

parameter LUT_IX	=	8;
parameter LUT_DW	=	24;

logic [LUT_DW-1:0] 	lut_u;
logic [N-1:0] 		b_tail, c_tail, u_tail, a_tail;
logic [LUT_IX-1:0] 	c_index;

logic [N-1:0]		e, eb, t1, t1b, t2, t3, t4;
logic [2*N-1:0]		k0, k1 ,k2, k3, k4;

LutDiv LutDiv
(
	.index		(	c_index		),
	.lut_div	(	lut_u		)
);

assign c_index = c_tail[N-2 -: 8];

assign b_tail = {1'b1, div_rb[22:0], {(N-24){1'b0}}  };
assign c_tail = {1'b1, div_rc[22:0], {(N-24){1'b0}}  };
assign u_tail = {1'b0, lut_u, {(N-25){1'b0}} };

always_comb begin
	k0 = u_tail * c_tail;
	e  = k0[N-2] ? (k0[2*N-2 : N-1] + 1) : k0[2*N-2 : N-1];
	
	eb = ~e + 1;
	
	k1 = e * eb;
	t1 = k1[N-2] ? (k1[2*N-2 : N-1] + 1) : k1[2*N-2 : N-1];
	
	t1b= ~t1 + 1;
	
	k2 = eb * t1b;
	t2 = k2[N-2] ? (k2[2*N-2 : N-1] + 1) : k2[2*N-2 : N-1];
	
	k3 = u_tail * b_tail;
	t3 = k3[N-2] ? (k3[2*N-2 : N-1] + 1) : k3[2*N-2 : N-1];
	
	k4 = t2 * t3;
	t4 = k4[N-2] ? (k4[2*N-2 : N-1] + 1) : k4[2*N-2 : N-1];
	
end

assign a_tail = t4;

assign div_ra = {a_tail[N-1 -: 24], 8'b0};

endmodule

