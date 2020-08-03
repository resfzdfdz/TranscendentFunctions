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
	logic [7:0]  index,
	logic [23:0] lut_div
);

always_comb begin
        case (index)
		8'b00000000: lut_div = 24'b111111110000000100000000;
		8'b00000001: lut_div = 24'b111111100000001111111010;
		8'b00000010: lut_div = 24'b111111010000100011100111;
		8'b00000011: lut_div = 24'b111111000000111111000010;
		8'b00000100: lut_div = 24'b111110110001100010000111;
		8'b00000101: lut_div = 24'b111110100010001100101110;
		8'b00000110: lut_div = 24'b111110010010111110110100;
		8'b00000111: lut_div = 24'b111110000011111000010001;
		8'b00001000: lut_div = 24'b111101110100111001000001;
		8'b00001001: lut_div = 24'b111101100110000000111111;
		8'b00001010: lut_div = 24'b111101010111010000000101;
		8'b00001011: lut_div = 24'b111101001000100110001111;
		8'b00001100: lut_div = 24'b111100111010000011010110;
		8'b00001101: lut_div = 24'b111100101011100111011000;
		8'b00001110: lut_div = 24'b111100011101010010001101;
		8'b00001111: lut_div = 24'b111100001111000011110010;
		8'b00010000: lut_div = 24'b111100000000111100000010;
		8'b00010001: lut_div = 24'b111011110010111010111000;
		8'b00010010: lut_div = 24'b111011100101000000010000;
		8'b00010011: lut_div = 24'b111011010111001100000101;
		8'b00010100: lut_div = 24'b111011001001011110010010;
		8'b00010101: lut_div = 24'b111010111011110110110100;
		8'b00010110: lut_div = 24'b111010101110010101100101;
		8'b00010111: lut_div = 24'b111010100000111010100010;
		8'b00011000: lut_div = 24'b111010010011100101100110;
		8'b00011001: lut_div = 24'b111010000110010110101110;
		8'b00011010: lut_div = 24'b111001111001001101110100;
		8'b00011011: lut_div = 24'b111001101100001010110101;
		8'b00011100: lut_div = 24'b111001011111001101101110;
		8'b00011101: lut_div = 24'b111001010010010110011001;
		8'b00011110: lut_div = 24'b111001000101100100110100;
		8'b00011111: lut_div = 24'b111000111000111000111010;
		8'b00100000: lut_div = 24'b111000101100010010101000;
		8'b00100001: lut_div = 24'b111000011111110001111001;
		8'b00100010: lut_div = 24'b111000010011010110101011;
		8'b00100011: lut_div = 24'b111000000111000000111001;
		8'b00100100: lut_div = 24'b110111111010110000100000;
		8'b00100101: lut_div = 24'b110111101110100101011101;
		8'b00100110: lut_div = 24'b110111100010011111101100;
		8'b00100111: lut_div = 24'b110111010110011111001010;
		8'b00101000: lut_div = 24'b110111001010100011110010;
		8'b00101001: lut_div = 24'b110110111110101101100011;
		8'b00101010: lut_div = 24'b110110110010111100011000;
		8'b00101011: lut_div = 24'b110110100111010000001111;
		8'b00101100: lut_div = 24'b110110011011101001000011;
		8'b00101101: lut_div = 24'b110110010000000110110011;
		8'b00101110: lut_div = 24'b110110000100101001011010;
		8'b00101111: lut_div = 24'b110101111001010000110111;
		8'b00110000: lut_div = 24'b110101101101111101000101;
		8'b00110001: lut_div = 24'b110101100010101110000010;
		8'b00110010: lut_div = 24'b110101010111100011101010;
		8'b00110011: lut_div = 24'b110101001100011101111100;
		8'b00110100: lut_div = 24'b110101000001011100110011;
		8'b00110101: lut_div = 24'b110100110110100000001110;
		8'b00110110: lut_div = 24'b110100101011101000001001;
		8'b00110111: lut_div = 24'b110100100000110100100010;
		8'b00111000: lut_div = 24'b110100010110000101010101;
		8'b00111001: lut_div = 24'b110100001011011010100001;
		8'b00111010: lut_div = 24'b110100000000110100000010;
		8'b00111011: lut_div = 24'b110011110110010001110101;
		8'b00111100: lut_div = 24'b110011101011110011111010;
		8'b00111101: lut_div = 24'b110011100001011010001011;
		8'b00111110: lut_div = 24'b110011010111000100101000;
		8'b00111111: lut_div = 24'b110011001100110011001110;
		8'b01000000: lut_div = 24'b110011000010100101111001;
		8'b01000001: lut_div = 24'b110010111000011100101001;
		8'b01000010: lut_div = 24'b110010101110010111011001;
		8'b01000011: lut_div = 24'b110010100100010110001001;
		8'b01000100: lut_div = 24'b110010011010011000110101;
		8'b01000101: lut_div = 24'b110010010000011111011011;
		8'b01000110: lut_div = 24'b110010000110101001111001;
		8'b01000111: lut_div = 24'b110001111100111000001101;
		8'b01001000: lut_div = 24'b110001110011001010010101;
		8'b01001001: lut_div = 24'b110001101001100000001101;
		8'b01001010: lut_div = 24'b110001011111111001110101;
		8'b01001011: lut_div = 24'b110001010110010111001001;
		8'b01001100: lut_div = 24'b110001001100111000001000;
		8'b01001101: lut_div = 24'b110001000011011100110000;
		8'b01001110: lut_div = 24'b110000111010000100111111;
		8'b01001111: lut_div = 24'b110000110000110000110001;
		8'b01010000: lut_div = 24'b110000100111100000000111;
		8'b01010001: lut_div = 24'b110000011110010010111100;
		8'b01010010: lut_div = 24'b110000010101001001010001;
		8'b01010011: lut_div = 24'b110000001100000011000001;
		8'b01010100: lut_div = 24'b110000000011000000001101;
		8'b01010101: lut_div = 24'b101111111010000000110001;
		8'b01010110: lut_div = 24'b101111110001000100101011;
		8'b01010111: lut_div = 24'b101111101000001011111011;
		8'b01011000: lut_div = 24'b101111011111010110011101;
		8'b01011001: lut_div = 24'b101111010110100100010001;
		8'b01011010: lut_div = 24'b101111001101110101010100;
		8'b01011011: lut_div = 24'b101111000101001001100101;
		8'b01011100: lut_div = 24'b101110111100100001000001;
		8'b01011101: lut_div = 24'b101110110011111011101000;
		8'b01011110: lut_div = 24'b101110101011011001010111;
		8'b01011111: lut_div = 24'b101110100010111010001100;
		8'b01100000: lut_div = 24'b101110011010011110000111;
		8'b01100001: lut_div = 24'b101110010010000101000101;
		8'b01100010: lut_div = 24'b101110001001101111000100;
		8'b01100011: lut_div = 24'b101110000001011100000011;
		8'b01100100: lut_div = 24'b101101111001001100000001;
		8'b01100101: lut_div = 24'b101101110000111110111100;
		8'b01100110: lut_div = 24'b101101101000110100110010;
		8'b01100111: lut_div = 24'b101101100000101101100001;
		8'b01101000: lut_div = 24'b101101011000101001001001;
		8'b01101001: lut_div = 24'b101101010000100111100111;
		8'b01101010: lut_div = 24'b101101001000101000111010;
		8'b01101011: lut_div = 24'b101101000000101101000001;
		8'b01101100: lut_div = 24'b101100111000110011111010;
		8'b01101101: lut_div = 24'b101100110000111101100100;
		8'b01101110: lut_div = 24'b101100101001001001111101;
		8'b01101111: lut_div = 24'b101100100001011001000011;
		8'b01110000: lut_div = 24'b101100011001101010110110;
		8'b01110001: lut_div = 24'b101100010001111111010100;
		8'b01110010: lut_div = 24'b101100001010010110011100;
		8'b01110011: lut_div = 24'b101100000010110000001011;
		8'b01110100: lut_div = 24'b101011111011001100100010;
		8'b01110101: lut_div = 24'b101011110011101011011110;
		8'b01110110: lut_div = 24'b101011101100001100111111;
		8'b01110111: lut_div = 24'b101011100100110001000010;
		8'b01111000: lut_div = 24'b101011011101010111100111;
		8'b01111001: lut_div = 24'b101011010110000000101100;
		8'b01111010: lut_div = 24'b101011001110101100010000;
		8'b01111011: lut_div = 24'b101011000111011010010010;
		8'b01111100: lut_div = 24'b101011000000001010110000;
		8'b01111101: lut_div = 24'b101010111000111101101010;
		8'b01111110: lut_div = 24'b101010110001110010111110;
		8'b01111111: lut_div = 24'b101010101010101010101011;
		8'b10000000: lut_div = 24'b101010100011100100110000;
		8'b10000001: lut_div = 24'b101010011100100001001011;
		8'b10000010: lut_div = 24'b101010010101011111111011;
		8'b10000011: lut_div = 24'b101010001110100001000000;
		8'b10000100: lut_div = 24'b101010000111100100010111;
		8'b10000101: lut_div = 24'b101010000000101010000001;
		8'b10000110: lut_div = 24'b101001111001110001111011;
		8'b10000111: lut_div = 24'b101001110010111100000110;
		8'b10001000: lut_div = 24'b101001101100001000011110;
		8'b10001001: lut_div = 24'b101001100101010111000101;
		8'b10001010: lut_div = 24'b101001011110100111110111;
		8'b10001011: lut_div = 24'b101001010111111010110101;
		8'b10001100: lut_div = 24'b101001010001001111111110;
		8'b10001101: lut_div = 24'b101001001010100111001111;
		8'b10001110: lut_div = 24'b101001000100000000101001;
		8'b10001111: lut_div = 24'b101000111101011100001011;
		8'b10010000: lut_div = 24'b101000110110111001110010;
		8'b10010001: lut_div = 24'b101000110000011001011111;
		8'b10010010: lut_div = 24'b101000101001111011001111;
		8'b10010011: lut_div = 24'b101000100011011111000011;
		8'b10010100: lut_div = 24'b101000011101000100111010;
		8'b10010101: lut_div = 24'b101000010110101100110001;
		8'b10010110: lut_div = 24'b101000010000010110101001;
		8'b10010111: lut_div = 24'b101000001010000010100001;
		8'b10011000: lut_div = 24'b101000000011110000010111;
		8'b10011001: lut_div = 24'b100111111101100000001010;
		8'b10011010: lut_div = 24'b100111110111010001111010;
		8'b10011011: lut_div = 24'b100111110001000101100110;
		8'b10011100: lut_div = 24'b100111101010111011001101;
		8'b10011101: lut_div = 24'b100111100100110010101101;
		8'b10011110: lut_div = 24'b100111011110101100000111;
		8'b10011111: lut_div = 24'b100111011000100111011001;
		8'b10100000: lut_div = 24'b100111010010100100100010;
		8'b10100001: lut_div = 24'b100111001100100011100010;
		8'b10100010: lut_div = 24'b100111000110100100010111;
		8'b10100011: lut_div = 24'b100111000000100111000001;
		8'b10100100: lut_div = 24'b100110111010101011011111;
		8'b10100101: lut_div = 24'b100110110100110001110000;
		8'b10100110: lut_div = 24'b100110101110111001110011;
		8'b10100111: lut_div = 24'b100110101001000011101000;
		8'b10101000: lut_div = 24'b100110100011001111001110;
		8'b10101001: lut_div = 24'b100110011101011100100011;
		8'b10101010: lut_div = 24'b100110010111101011101000;
		8'b10101011: lut_div = 24'b100110010001111100011011;
		8'b10101100: lut_div = 24'b100110001100001110111011;
		8'b10101101: lut_div = 24'b100110000110100011001000;
		8'b10101110: lut_div = 24'b100110000000111001000010;
		8'b10101111: lut_div = 24'b100101111011010000100110;
		8'b10110000: lut_div = 24'b100101110101101001110101;
		8'b10110001: lut_div = 24'b100101110000000100101110;
		8'b10110010: lut_div = 24'b100101101010100001010000;
		8'b10110011: lut_div = 24'b100101100100111111011011;
		8'b10110100: lut_div = 24'b100101011111011111001101;
		8'b10110101: lut_div = 24'b100101011010000000100110;
		8'b10110110: lut_div = 24'b100101010100100011100101;
		8'b10110111: lut_div = 24'b100101001111001000001001;
		8'b10111000: lut_div = 24'b100101001001101110010011;
		8'b10111001: lut_div = 24'b100101000100010110000001;
		8'b10111010: lut_div = 24'b100100111110111111010010;
		8'b10111011: lut_div = 24'b100100111001101010000110;
		8'b10111100: lut_div = 24'b100100110100010110011100;
		8'b10111101: lut_div = 24'b100100101111000100010100;
		8'b10111110: lut_div = 24'b100100101001110011101100;
		8'b10111111: lut_div = 24'b100100100100100100100101;
		8'b11000000: lut_div = 24'b100100011111010110111101;
		8'b11000001: lut_div = 24'b100100011010001010110100;
		8'b11000010: lut_div = 24'b100100010101000000001001;
		8'b11000011: lut_div = 24'b100100001111110110111100;
		8'b11000100: lut_div = 24'b100100001010101111001100;
		8'b11000101: lut_div = 24'b100100000101101000111001;
		8'b11000110: lut_div = 24'b100100000000100100000001;
		8'b11000111: lut_div = 24'b100011111011100000100100;
		8'b11001000: lut_div = 24'b100011110110011110100010;
		8'b11001001: lut_div = 24'b100011110001011101111010;
		8'b11001010: lut_div = 24'b100011101100011110101011;
		8'b11001011: lut_div = 24'b100011100111100000110110;
		8'b11001100: lut_div = 24'b100011100010100100011000;
		8'b11001101: lut_div = 24'b100011011101101001010010;
		8'b11001110: lut_div = 24'b100011011000101111100011;
		8'b11001111: lut_div = 24'b100011010011110111001011;
		8'b11010000: lut_div = 24'b100011001111000000001001;
		8'b11010001: lut_div = 24'b100011001010001010011100;
		8'b11010010: lut_div = 24'b100011000101010110000100;
		8'b11010011: lut_div = 24'b100011000000100011000001;
		8'b11010100: lut_div = 24'b100010111011110001010001;
		8'b11010101: lut_div = 24'b100010110111000000110100;
		8'b11010110: lut_div = 24'b100010110010010001101011;
		8'b11010111: lut_div = 24'b100010101101100011110011;
		8'b11011000: lut_div = 24'b100010101000110111001101;
		8'b11011001: lut_div = 24'b100010100100001011111001;
		8'b11011010: lut_div = 24'b100010011111100001110100;
		8'b11011011: lut_div = 24'b100010011010111001000001;
		8'b11011100: lut_div = 24'b100010010110010001011100;
		8'b11011101: lut_div = 24'b100010010001101011000111;
		8'b11011110: lut_div = 24'b100010001101000110000001;
		8'b11011111: lut_div = 24'b100010001000100010001001;
		8'b11100000: lut_div = 24'b100010000011111111011110;
		8'b11100001: lut_div = 24'b100001111111011110000001;
		8'b11100010: lut_div = 24'b100001111010111101110000;
		8'b11100011: lut_div = 24'b100001110110011110101011;
		8'b11100100: lut_div = 24'b100001110010000000110011;
		8'b11100101: lut_div = 24'b100001101101100100000101;
		8'b11100110: lut_div = 24'b100001101001001000100011;
		8'b11100111: lut_div = 24'b100001100100101110001011;
		8'b11101000: lut_div = 24'b100001100000010100111100;
		8'b11101001: lut_div = 24'b100001011011111100110111;
		8'b11101010: lut_div = 24'b100001010111100101111100;
		8'b11101011: lut_div = 24'b100001010011010000001000;
		8'b11101100: lut_div = 24'b100001001110111011011101;
		8'b11101101: lut_div = 24'b100001001010100111111010;
		8'b11101110: lut_div = 24'b100001000110010101011110;
		8'b11101111: lut_div = 24'b100001000010000100001000;
		8'b11110000: lut_div = 24'b100000111101110011111001;
		8'b11110001: lut_div = 24'b100000111001100100110000;
		8'b11110010: lut_div = 24'b100000110101010110101101;
		8'b11110011: lut_div = 24'b100000110001001001101111;
		8'b11110100: lut_div = 24'b100000101100111101110101;
		8'b11110101: lut_div = 24'b100000101000110011000000;
		8'b11110110: lut_div = 24'b100000100100101001001110;
		8'b11110111: lut_div = 24'b100000100000100000100001;
		8'b11111000: lut_div = 24'b100000011100011000110110;
		8'b11111001: lut_div = 24'b100000011000010010001110;
		8'b11111010: lut_div = 24'b100000010100001100101000;
		8'b11111011: lut_div = 24'b100000010000001000000100;
		8'b11111100: lut_div = 24'b100000001100000100100010;
		8'b11111101: lut_div = 24'b100000001000000010000001;
		8'b11111110: lut_div = 24'b100000000100000000100000;
		8'b11111111: lut_div = 24'b100000000000000000000000;

        endcase
end

endmodule
