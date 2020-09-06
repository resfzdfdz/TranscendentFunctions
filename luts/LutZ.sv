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
module LutZ
(
	input  logic [7:0]  index,
	output logic [23:0] lut_value
);

always_comb begin
    case (index)
		8'b00000000:	lut_value = 25'b0010110100010100001111110;
		8'b00000001:	lut_value = 25'b0010110011100111110001101;
		8'b00000010:	lut_value = 25'b0010110010111011110100001;
		8'b00000011:	lut_value = 25'b0010110010010000010110101;
		8'b00000100:	lut_value = 25'b0010110001100101011000100;
		8'b00000101:	lut_value = 25'b0010110000111010111001011;
		8'b00000110:	lut_value = 25'b0010110000010000111000100;
		8'b00000111:	lut_value = 25'b0010101111100111010101010;
		8'b00001000:	lut_value = 25'b0010101110111110001111001;
		8'b00001001:	lut_value = 25'b0010101110010101100101110;
		8'b00001010:	lut_value = 25'b0010101101101101011000100;
		8'b00001011:	lut_value = 25'b0010101101000101100110110;
		8'b00001100:	lut_value = 25'b0010101100011110010000010;
		8'b00001101:	lut_value = 25'b0010101011110111010100011;
		8'b00001110:	lut_value = 25'b0010101011010000110010101;
		8'b00001111:	lut_value = 25'b0010101010101010101010110;
		8'b00010000:	lut_value = 25'b0010101010000100111100000;
		8'b00010001:	lut_value = 25'b0010101001011111100110001;
		8'b00010010:	lut_value = 25'b0010101000111010101000110;
		8'b00010011:	lut_value = 25'b0010101000010110000011011;
		8'b00010100:	lut_value = 25'b0010100111110001110101100;
		8'b00010101:	lut_value = 25'b0010100111001101111111000;
		8'b00010110:	lut_value = 25'b0010100110101010011111010;
		8'b00010111:	lut_value = 25'b0010100110000111010101111;
		8'b00011000:	lut_value = 25'b0010100101100100100010110;
		8'b00011001:	lut_value = 25'b0010100101000010000101011;
		8'b00011010:	lut_value = 25'b0010100100011111111101010;
		8'b00011011:	lut_value = 25'b0010100011111110001010001;
		8'b00011100:	lut_value = 25'b0010100011011100101011110;
		8'b00011101:	lut_value = 25'b0010100010111011100001111;
		8'b00011110:	lut_value = 25'b0010100010011010101011111;
		8'b00011111:	lut_value = 25'b0010100001111010001001110;
		8'b00100000:	lut_value = 25'b0010100001011001111011000;
		8'b00100001:	lut_value = 25'b0010100000111001111111010;
		8'b00100010:	lut_value = 25'b0010100000011010010110100;
		8'b00100011:	lut_value = 25'b0010011111111011000000010;
		8'b00100100:	lut_value = 25'b0010011111011011111100010;
		8'b00100101:	lut_value = 25'b0010011110111101001010010;
		8'b00100110:	lut_value = 25'b0010011110011110101010000;
		8'b00100111:	lut_value = 25'b0010011110000000011011001;
		8'b00101000:	lut_value = 25'b0010011101100010011101100;
		8'b00101001:	lut_value = 25'b0010011101000100110000111;
		8'b00101010:	lut_value = 25'b0010011100100111010100111;
		8'b00101011:	lut_value = 25'b0010011100001010001001011;
		8'b00101100:	lut_value = 25'b0010011011101101001110001;
		8'b00101101:	lut_value = 25'b0010011011010000100010110;
		8'b00101110:	lut_value = 25'b0010011010110100000111001;
		8'b00101111:	lut_value = 25'b0010011010010111111011001;
		8'b00110000:	lut_value = 25'b0010011001111011111110011;
		8'b00110001:	lut_value = 25'b0010011001100000010000110;
		8'b00110010:	lut_value = 25'b0010011001000100110010000;
		8'b00110011:	lut_value = 25'b0010011000101001100001111;
		8'b00110100:	lut_value = 25'b0010011000001110100000010;
		8'b00110101:	lut_value = 25'b0010010111110011101101000;
		8'b00110110:	lut_value = 25'b0010010111011001000111110;
		8'b00110111:	lut_value = 25'b0010010110111110110000011;
		8'b00111000:	lut_value = 25'b0010010110100100100110110;
		8'b00111001:	lut_value = 25'b0010010110001010101010101;
		8'b00111010:	lut_value = 25'b0010010101110000111011110;
		8'b00111011:	lut_value = 25'b0010010101010111011010001;
		8'b00111100:	lut_value = 25'b0010010100111110000101100;
		8'b00111101:	lut_value = 25'b0010010100100100111101101;
		8'b00111110:	lut_value = 25'b0010010100001100000010011;
		8'b00111111:	lut_value = 25'b0010010011110011010011101;
		8'b01000000:	lut_value = 25'b0010010011011010110001010;
		8'b01000001:	lut_value = 25'b0010010011000010011011000;
		8'b01000010:	lut_value = 25'b0010010010101010010000110;
		8'b01000011:	lut_value = 25'b0010010010010010010010010;
		8'b01000100:	lut_value = 25'b0010010001111010011111100;
		8'b01000101:	lut_value = 25'b0010010001100010111000011;
		8'b01000110:	lut_value = 25'b0010010001001011011100101;
		8'b01000111:	lut_value = 25'b0010010000110100001100001;
		8'b01001000:	lut_value = 25'b0010010000011101000110110;
		8'b01001001:	lut_value = 25'b0010010000000110001100011;
		8'b01001010:	lut_value = 25'b0010001111101111011100111;
		8'b01001011:	lut_value = 25'b0010001111011000111000000;
		8'b01001100:	lut_value = 25'b0010001111000010011101110;
		8'b01001101:	lut_value = 25'b0010001110101100001110000;
		8'b01001110:	lut_value = 25'b0010001110010110001000100;
		8'b01001111:	lut_value = 25'b0010001110000000001101010;
		8'b01010000:	lut_value = 25'b0010001101101010011100001;
		8'b01010001:	lut_value = 25'b0010001101010100110101000;
		8'b01010010:	lut_value = 25'b0010001100111111010111101;
		8'b01010011:	lut_value = 25'b0010001100101010000100000;
		8'b01010100:	lut_value = 25'b0010001100010100111010000;
		8'b01010101:	lut_value = 25'b0010001011111111111001011;
		8'b01010110:	lut_value = 25'b0010001011101011000010010;
		8'b01010111:	lut_value = 25'b0010001011010110010100100;
		8'b01011000:	lut_value = 25'b0010001011000001101111111;
		8'b01011001:	lut_value = 25'b0010001010101101010100010;
		8'b01011010:	lut_value = 25'b0010001010011001000001101;
		8'b01011011:	lut_value = 25'b0010001010000100110111111;
		8'b01011100:	lut_value = 25'b0010001001110000110110111;
		8'b01011101:	lut_value = 25'b0010001001011100111110100;
		8'b01011110:	lut_value = 25'b0010001001001001001110110;
		8'b01011111:	lut_value = 25'b0010001000110101100111011;
		8'b01100000:	lut_value = 25'b0010001000100010001000100;
		8'b01100001:	lut_value = 25'b0010001000001110110001111;
		8'b01100010:	lut_value = 25'b0010000111111011100011100;
		8'b01100011:	lut_value = 25'b0010000111101000011101001;
		8'b01100100:	lut_value = 25'b0010000111010101011110110;
		8'b01100101:	lut_value = 25'b0010000111000010101000011;
		8'b01100110:	lut_value = 25'b0010000110101111111001111;
		8'b01100111:	lut_value = 25'b0010000110011101010011001;
		8'b01101000:	lut_value = 25'b0010000110001010110100000;
		8'b01101001:	lut_value = 25'b0010000101111000011100100;
		8'b01101010:	lut_value = 25'b0010000101100110001100100;
		8'b01101011:	lut_value = 25'b0010000101010100000011111;
		8'b01101100:	lut_value = 25'b0010000101000010000010101;
		8'b01101101:	lut_value = 25'b0010000100110000001000101;
		8'b01101110:	lut_value = 25'b0010000100011110010101111;
		8'b01101111:	lut_value = 25'b0010000100001100101010010;
		8'b01110000:	lut_value = 25'b0010000011111011000101110;
		8'b01110001:	lut_value = 25'b0010000011101001101000001;
		8'b01110010:	lut_value = 25'b0010000011011000010001011;
		8'b01110011:	lut_value = 25'b0010000011000111000001101;
		8'b01110100:	lut_value = 25'b0010000010110101111000100;
		8'b01110101:	lut_value = 25'b0010000010100100110110001;
		8'b01110110:	lut_value = 25'b0010000010010011111010011;
		8'b01110111:	lut_value = 25'b0010000010000011000101001;
		8'b01111000:	lut_value = 25'b0010000001110010010110011;
		8'b01111001:	lut_value = 25'b0010000001100001101110001;
		8'b01111010:	lut_value = 25'b0010000001010001001100010;
		8'b01111011:	lut_value = 25'b0010000001000000110000101;
		8'b01111100:	lut_value = 25'b0010000000110000011011010;
		8'b01111101:	lut_value = 25'b0010000000100000001100001;
		8'b01111110:	lut_value = 25'b0010000000010000000011000;
		8'b01111111:	lut_value = 25'b0010000000000000000000000;
		8'b10000000:	lut_value = 25'b0011111110000001011110111;
		8'b10000001:	lut_value = 25'b0011111110000001011110111;
		8'b10000010:	lut_value = 25'b0011111100000101110110011;
		8'b10000011:	lut_value = 25'b0011111100000101110110011;
		8'b10000100:	lut_value = 25'b0011111010001100111111101;
		8'b10000101:	lut_value = 25'b0011111010001100111111101;
		8'b10000110:	lut_value = 25'b0011111000010110110100001;
		8'b10000111:	lut_value = 25'b0011111000010110110100001;
		8'b10001000:	lut_value = 25'b0011110110100011001101110;
		8'b10001001:	lut_value = 25'b0011110110100011001101110;
		8'b10001010:	lut_value = 25'b0011110100110010000110011;
		8'b10001011:	lut_value = 25'b0011110100110010000110011;
		8'b10001100:	lut_value = 25'b0011110011000011011000101;
		8'b10001101:	lut_value = 25'b0011110011000011011000101;
		8'b10001110:	lut_value = 25'b0011110001010110111111000;
		8'b10001111:	lut_value = 25'b0011110001010110111111000;
		8'b10010000:	lut_value = 25'b0011101111101100110100010;
		8'b10010001:	lut_value = 25'b0011101111101100110100010;
		8'b10010010:	lut_value = 25'b0011101110000100110011111;
		8'b10010011:	lut_value = 25'b0011101110000100110011111;
		8'b10010100:	lut_value = 25'b0011101100011110111001000;
		8'b10010101:	lut_value = 25'b0011101100011110111001000;
		8'b10010110:	lut_value = 25'b0011101010111010111111011;
		8'b10010111:	lut_value = 25'b0011101010111010111111011;
		8'b10011000:	lut_value = 25'b0011101001011001000010101;
		8'b10011001:	lut_value = 25'b0011101001011001000010101;
		8'b10011010:	lut_value = 25'b0011100111111000111110111;
		8'b10011011:	lut_value = 25'b0011100111111000111110111;
		8'b10011100:	lut_value = 25'b0011100110011010110000001;
		8'b10011101:	lut_value = 25'b0011100110011010110000001;
		8'b10011110:	lut_value = 25'b0011100100111110010011000;
		8'b10011111:	lut_value = 25'b0011100100111110010011000;
		8'b10100000:	lut_value = 25'b0011100011100011100011100;
		8'b10100001:	lut_value = 25'b0011100011100011100011100;
		8'b10100010:	lut_value = 25'b0011100010001010011110110;
		8'b10100011:	lut_value = 25'b0011100010001010011110110;
		8'b10100100:	lut_value = 25'b0011100000110011000001011;
		8'b10100101:	lut_value = 25'b0011100000110011000001011;
		8'b10100110:	lut_value = 25'b0011011111011101001000010;
		8'b10100111:	lut_value = 25'b0011011111011101001000010;
		8'b10101000:	lut_value = 25'b0011011110001000110000010;
		8'b10101001:	lut_value = 25'b0011011110001000110000010;
		8'b10101010:	lut_value = 25'b0011011100110101110110111;
		8'b10101011:	lut_value = 25'b0011011100110101110110111;
		8'b10101100:	lut_value = 25'b0011011011100100011001010;
		8'b10101101:	lut_value = 25'b0011011011100100011001010;
		8'b10101110:	lut_value = 25'b0011011010010100010100101;
		8'b10101111:	lut_value = 25'b0011011010010100010100101;
		8'b10110000:	lut_value = 25'b0011011001000101100110101;
		8'b10110001:	lut_value = 25'b0011011001000101100110101;
		8'b10110010:	lut_value = 25'b0011010111111000001100111;
		8'b10110011:	lut_value = 25'b0011010111111000001100111;
		8'b10110100:	lut_value = 25'b0011010110101100000101001;
		8'b10110101:	lut_value = 25'b0011010110101100000101001;
		8'b10110110:	lut_value = 25'b0011010101100001001100111;
		8'b10110111:	lut_value = 25'b0011010101100001001100111;
		8'b10111000:	lut_value = 25'b0011010100010111100010001;
		8'b10111001:	lut_value = 25'b0011010100010111100010001;
		8'b10111010:	lut_value = 25'b0011010011001111000010111;
		8'b10111011:	lut_value = 25'b0011010011001111000010111;
		8'b10111100:	lut_value = 25'b0011010010000111101101000;
		8'b10111101:	lut_value = 25'b0011010010000111101101000;
		8'b10111110:	lut_value = 25'b0011010001000001011110110;
		8'b10111111:	lut_value = 25'b0011010001000001011110110;
		8'b11000000:	lut_value = 25'b0011001111111100010110000;
		8'b11000001:	lut_value = 25'b0011001111111100010110000;
		8'b11000010:	lut_value = 25'b0011001110111000010001011;
		8'b11000011:	lut_value = 25'b0011001110111000010001011;
		8'b11000100:	lut_value = 25'b0011001101110101001110111;
		8'b11000101:	lut_value = 25'b0011001101110101001110111;
		8'b11000110:	lut_value = 25'b0011001100110011001100110;
		8'b11000111:	lut_value = 25'b0011001100110011001100110;
		8'b11001000:	lut_value = 25'b0011001011110010001001110;
		8'b11001001:	lut_value = 25'b0011001011110010001001110;
		8'b11001010:	lut_value = 25'b0011001010110010000100000;
		8'b11001011:	lut_value = 25'b0011001010110010000100000;
		8'b11001100:	lut_value = 25'b0011001001110010111010001;
		8'b11001101:	lut_value = 25'b0011001001110010111010001;
		8'b11001110:	lut_value = 25'b0011001000110100101010101;
		8'b11001111:	lut_value = 25'b0011001000110100101010101;
		8'b11010000:	lut_value = 25'b0011000111110111010100011;
		8'b11010001:	lut_value = 25'b0011000111110111010100011;
		8'b11010010:	lut_value = 25'b0011000110111010110101101;
		8'b11010011:	lut_value = 25'b0011000110111010110101101;
		8'b11010100:	lut_value = 25'b0011000101111111001101011;
		8'b11010101:	lut_value = 25'b0011000101111111001101011;
		8'b11010110:	lut_value = 25'b0011000101000100011010001;
		8'b11010111:	lut_value = 25'b0011000101000100011010001;
		8'b11011000:	lut_value = 25'b0011000100001010011011000;
		8'b11011001:	lut_value = 25'b0011000100001010011011000;
		8'b11011010:	lut_value = 25'b0011000011010001001110011;
		8'b11011011:	lut_value = 25'b0011000011010001001110011;
		8'b11011100:	lut_value = 25'b0011000010011000110011100;
		8'b11011101:	lut_value = 25'b0011000010011000110011100;
		8'b11011110:	lut_value = 25'b0011000001100001001001000;
		8'b11011111:	lut_value = 25'b0011000001100001001001000;
		8'b11100000:	lut_value = 25'b0011000000101010001101111;
		8'b11100001:	lut_value = 25'b0011000000101010001101111;
		8'b11100010:	lut_value = 25'b0010111111110100000001001;
		8'b11100011:	lut_value = 25'b0010111111110100000001001;
		8'b11100100:	lut_value = 25'b0010111110111110100001110;
		8'b11100101:	lut_value = 25'b0010111110111110100001110;
		8'b11100110:	lut_value = 25'b0010111110001001101110101;
		8'b11100111:	lut_value = 25'b0010111110001001101110101;
		8'b11101000:	lut_value = 25'b0010111101010101100111001;
		8'b11101001:	lut_value = 25'b0010111101010101100111001;
		8'b11101010:	lut_value = 25'b0010111100100010001001111;
		8'b11101011:	lut_value = 25'b0010111100100010001001111;
		8'b11101100:	lut_value = 25'b0010111011101111010110100;
		8'b11101101:	lut_value = 25'b0010111011101111010110100;
		8'b11101110:	lut_value = 25'b0010111010111101001011101;
		8'b11101111:	lut_value = 25'b0010111010111101001011101;
		8'b11110000:	lut_value = 25'b0010111010001011101000110;
		8'b11110001:	lut_value = 25'b0010111010001011101000110;
		8'b11110010:	lut_value = 25'b0010111001011010101100111;
		8'b11110011:	lut_value = 25'b0010111001011010101100111;
		8'b11110100:	lut_value = 25'b0010111000101010010111010;
		8'b11110101:	lut_value = 25'b0010111000101010010111010;
		8'b11110110:	lut_value = 25'b0010110111111010100111010;
		8'b11110111:	lut_value = 25'b0010110111111010100111010;
		8'b11111000:	lut_value = 25'b0010110111001011011011111;
		8'b11111001:	lut_value = 25'b0010110111001011011011111;
		8'b11111010:	lut_value = 25'b0010110110011100110100101;
		8'b11111011:	lut_value = 25'b0010110110011100110100101;
		8'b11111100:	lut_value = 25'b0010110101101110110000101;
		8'b11111101:	lut_value = 25'b0010110101101110110000101;
		8'b11111110:	lut_value = 25'b0010110101000001001111001;
		8'b11111111:	lut_value = 25'b0010110101000001001111001;
	endcase
end

endmodule