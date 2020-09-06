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
	input  logic [4:0]  index,
	output logic [23:0] lut_value
);

always_comb begin
    case (index)
		5'b00000: lut_value = 24'b111110000011111000010001;
		5'b00001: lut_value = 24'b111100001111000011110010;
		5'b00010: lut_value = 24'b111010100000111010100010;
		5'b00011: lut_value = 24'b111000111000111000111010;
		5'b00100: lut_value = 24'b110111010110011111001010;
		5'b00101: lut_value = 24'b110101111001010000110111;
		5'b00110: lut_value = 24'b110100100000110100100010;
		5'b00111: lut_value = 24'b110011001100110011001110;
		5'b01000: lut_value = 24'b110001111100111000001101;
		5'b01001: lut_value = 24'b110000110000110000110001;
		5'b01010: lut_value = 24'b101111101000001011111011;
		5'b01011: lut_value = 24'b101110100010111010001100;
		5'b01100: lut_value = 24'b101101100000101101100001;
		5'b01101: lut_value = 24'b101100100001011001000011;
		5'b01110: lut_value = 24'b101011100100110001000010;
		5'b01111: lut_value = 24'b101010101010101010101011;
		5'b10000: lut_value = 24'b101001110010111100000110;
		5'b10001: lut_value = 24'b101000111101011100001011;
		5'b10010: lut_value = 24'b101000001010000010100001;
		5'b10011: lut_value = 24'b100111011000100111011001;
		5'b10100: lut_value = 24'b100110101001000011101000;
		5'b10101: lut_value = 24'b100101111011010000100110;
		5'b10110: lut_value = 24'b100101001111001000001001;
		5'b10111: lut_value = 24'b100100100100100100100101;
		5'b11000: lut_value = 24'b100011111011100000100100;
		5'b11001: lut_value = 24'b100011010011110111001011;
		5'b11010: lut_value = 24'b100010101101100011110011;
		5'b11011: lut_value = 24'b100010001000100010001001;
		5'b11100: lut_value = 24'b100001100100101110001011;
		5'b11101: lut_value = 24'b100001000010000100001000;
		5'b11110: lut_value = 24'b100000100000100000100001;
		5'b11111: lut_value = 24'b100000000000000000000000;
	endcase
end

endmodule