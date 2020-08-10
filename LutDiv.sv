/*******************************************************************************
  Copyright 2019 Xi'an Jiaotong University

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*******************************************************************************/
module LutDiv
(
	logic [3:0]  index,
	logic [23:0] lut_div
);

always_comb begin
    case (index)
		4'b0000: lut_div = 24'b111100001111000011110010;
		4'b0001: lut_div = 24'b111000111000111000111010;
		4'b0010: lut_div = 24'b110101111001010000110111;
		4'b0011: lut_div = 24'b110011001100110011001110;
		4'b0100: lut_div = 24'b110000110000110000110001;
		4'b0101: lut_div = 24'b101110100010111010001100;
		4'b0110: lut_div = 24'b101100100001011001000011;
		4'b0111: lut_div = 24'b101010101010101010101011;
		4'b1000: lut_div = 24'b101000111101011100001011;
		4'b1001: lut_div = 24'b100111011000100111011001;
		4'b1010: lut_div = 24'b100101111011010000100110;
		4'b1011: lut_div = 24'b100100100100100100100101;
		4'b1100: lut_div = 24'b100011010011110111001011;
		4'b1101: lut_div = 24'b100010001000100010001001;
		4'b1110: lut_div = 24'b100001000010000100001000;
		4'b1111: lut_div = 24'b100000000000000000000000;
	endcase
end

endmodule
