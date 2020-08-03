
module tb_FloatDiv;

logic [31:0] a, b, c;

assign b = 32'b00111111111001011110111111010000;
assign c = 32'b00111111100010111000000001110111;

FloatDiv FloatDiv
(
	.div_rb		(	b			),
	.div_rc		(	c			),
	.div_ra		(	a			)
);

endmodule