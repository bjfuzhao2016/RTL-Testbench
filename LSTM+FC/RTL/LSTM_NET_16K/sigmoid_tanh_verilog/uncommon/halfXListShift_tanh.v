module halfXListShift_tanh #(
parameter xDW = 24,
parameter ML = 275,
parameter MW = 9
)(
input wire [(MW - 1) : 0] j, //输入5位无符号数
output wire [(xDW - 1) : 0] half_j,
output wire [(xDW - 1) : 0] half_j_1
);

wire [(xDW - 1) : 0] halfXList [(ML + 1):0]; 

// assign halfXList[0] = 16'h0000;
// assign halfXList[1] = 16'h0000; 
// assign halfXList[2] = 16'h0100; 
// assign halfXList[3] = 16'h0200; 
// assign halfXList[4] = 16'h0280; 
// assign halfXList[5] = 16'h0300; 
// assign halfXList[6] = 16'h0380; 
// assign halfXList[7] = 16'h0400; 
// assign halfXList[8] = 16'h0480; 
// assign halfXList[9] = 16'h0500; 
// assign halfXList[10] = 16'h0580; 
// assign halfXList[11] = 16'h0600; 
// assign halfXList[12] = 16'h0680; 
// assign halfXList[13] = 16'h0700; 
// assign halfXList[14] = 16'h0780; 
// assign halfXList[15] = 16'h0800; 
// assign halfXList[16] = 16'h0880; 
// assign halfXList[17] = 16'h0900; 
// assign halfXList[18] = 16'h0980; 
// assign halfXList[19] = 16'h0a00; 
// assign halfXList[20] = 16'h0a80; 
// assign halfXList[21] = 16'h0b00; 
// assign halfXList[22] = 16'h0c00; 
// assign halfXList[23] = 16'h0d00; 
// assign halfXList[24] = 16'h0e00; 
// assign halfXList[25] = 16'h0f00; 
// assign halfXList[26] = 16'h1000; 
// assign halfXList[27] = 16'h1100; 
// assign halfXList[28] = 16'h1200; 
// assign halfXList[29] = 16'h1400; 
// assign halfXList[30] = 16'h1600; 
// assign halfXList[31] = 16'h1800; 
// assign halfXList[32] = 16'h1c00; 
// assign halfXList[33] = 16'h2000; 
// assign halfXList[34] = 16'h4000; 
// assign halfXList[35] = 16'h8000; //此为补码表示

// assign halfXList[0] = 24'h000000; 
// assign halfXList[1] = 24'h000000; 
// assign halfXList[2] = 24'h000800; 
// assign halfXList[3] = 24'h001000; 
// assign halfXList[4] = 24'h001400; 
// assign halfXList[5] = 24'h001800; 
// assign halfXList[6] = 24'h001c00; 
// assign halfXList[7] = 24'h002000; 
// assign halfXList[8] = 24'h002400; 
// assign halfXList[9] = 24'h002800; 
// assign halfXList[10] = 24'h002c00; 
// assign halfXList[11] = 24'h003000; 
// assign halfXList[12] = 24'h003400; 
// assign halfXList[13] = 24'h003800; 
// assign halfXList[14] = 24'h003c00; 
// assign halfXList[15] = 24'h004000; 
// assign halfXList[16] = 24'h004400; 
// assign halfXList[17] = 24'h004800; 
// assign halfXList[18] = 24'h004c00; 
// assign halfXList[19] = 24'h005000; 
// assign halfXList[20] = 24'h005400; 
// assign halfXList[21] = 24'h005800; 
// assign halfXList[22] = 24'h006000; 
// assign halfXList[23] = 24'h006800; 
// assign halfXList[24] = 24'h007000; 
// assign halfXList[25] = 24'h007800; 
// assign halfXList[26] = 24'h008000; 
// assign halfXList[27] = 24'h008800; 
// assign halfXList[28] = 24'h009000; 
// assign halfXList[29] = 24'h00a000; 
// assign halfXList[30] = 24'h00b000; 
// assign halfXList[31] = 24'h00c000; 
// assign halfXList[32] = 24'h00e000; 
// assign halfXList[33] = 24'h010000; 
// assign halfXList[34] = 24'h020000; 
// assign halfXList[35] = 24'h040000; 

assign halfXList[0] = 24'h000000; 
assign halfXList[1] = 24'h000000; 
assign halfXList[2] = 24'h000200; 
assign halfXList[3] = 24'h000300; 
assign halfXList[4] = 24'h000400; 
assign halfXList[5] = 24'h000500; 
assign halfXList[6] = 24'h000600; 
assign halfXList[7] = 24'h000700; 
assign halfXList[8] = 24'h000800; 
assign halfXList[9] = 24'h000900; 
assign halfXList[10] = 24'h000a00; 
assign halfXList[11] = 24'h000b00; 
assign halfXList[12] = 24'h000b80; 
assign halfXList[13] = 24'h000c00; 
assign halfXList[14] = 24'h000c80; 
assign halfXList[15] = 24'h000d00; 
assign halfXList[16] = 24'h000d80; 
assign halfXList[17] = 24'h000e00; 
assign halfXList[18] = 24'h000e80; 
assign halfXList[19] = 24'h000f00; 
assign halfXList[20] = 24'h000f80; 
assign halfXList[21] = 24'h001000; 
assign halfXList[22] = 24'h001080; 
assign halfXList[23] = 24'h001100; 
assign halfXList[24] = 24'h001180; 
assign halfXList[25] = 24'h001200; 
assign halfXList[26] = 24'h001280; 
assign halfXList[27] = 24'h001300; 
assign halfXList[28] = 24'h001380; 
assign halfXList[29] = 24'h001400; 
assign halfXList[30] = 24'h001480; 
assign halfXList[31] = 24'h001500; 
assign halfXList[32] = 24'h001580; 
assign halfXList[33] = 24'h001600; 
assign halfXList[34] = 24'h001680; 
assign halfXList[35] = 24'h001700; 
assign halfXList[36] = 24'h001780; 
assign halfXList[37] = 24'h001800; 
assign halfXList[38] = 24'h001880; 
assign halfXList[39] = 24'h001900; 
assign halfXList[40] = 24'h001980; 
assign halfXList[41] = 24'h001a00; 
assign halfXList[42] = 24'h001a80; 
assign halfXList[43] = 24'h001b00; 
assign halfXList[44] = 24'h001b80; 
assign halfXList[45] = 24'h001c00; 
assign halfXList[46] = 24'h001c80; 
assign halfXList[47] = 24'h001d00; 
assign halfXList[48] = 24'h001d80; 
assign halfXList[49] = 24'h001e00; 
assign halfXList[50] = 24'h001e80; 
assign halfXList[51] = 24'h001f00; 
assign halfXList[52] = 24'h001f80; 
assign halfXList[53] = 24'h002000; 
assign halfXList[54] = 24'h002080; 
assign halfXList[55] = 24'h002100; 
assign halfXList[56] = 24'h002180; 
assign halfXList[57] = 24'h002200; 
assign halfXList[58] = 24'h002280; 
assign halfXList[59] = 24'h002300; 
assign halfXList[60] = 24'h002380; 
assign halfXList[61] = 24'h002400; 
assign halfXList[62] = 24'h002480; 
assign halfXList[63] = 24'h002500; 
assign halfXList[64] = 24'h002580; 
assign halfXList[65] = 24'h002600; 
assign halfXList[66] = 24'h002680; 
assign halfXList[67] = 24'h002700; 
assign halfXList[68] = 24'h002780; 
assign halfXList[69] = 24'h002800; 
assign halfXList[70] = 24'h002880; 
assign halfXList[71] = 24'h002900; 
assign halfXList[72] = 24'h002980; 
assign halfXList[73] = 24'h002a00; 
assign halfXList[74] = 24'h002a80; 
assign halfXList[75] = 24'h002b00; 
assign halfXList[76] = 24'h002b80; 
assign halfXList[77] = 24'h002c00; 
assign halfXList[78] = 24'h002c80; 
assign halfXList[79] = 24'h002d00; 
assign halfXList[80] = 24'h002d80; 
assign halfXList[81] = 24'h002e00; 
assign halfXList[82] = 24'h002e80; 
assign halfXList[83] = 24'h002f00; 
assign halfXList[84] = 24'h002f80; 
assign halfXList[85] = 24'h003000; 
assign halfXList[86] = 24'h003080; 
assign halfXList[87] = 24'h003100; 
assign halfXList[88] = 24'h003180; 
assign halfXList[89] = 24'h003200; 
assign halfXList[90] = 24'h003280; 
assign halfXList[91] = 24'h003300; 
assign halfXList[92] = 24'h003380; 
assign halfXList[93] = 24'h003400; 
assign halfXList[94] = 24'h003480; 
assign halfXList[95] = 24'h003500; 
assign halfXList[96] = 24'h003580; 
assign halfXList[97] = 24'h003600; 
assign halfXList[98] = 24'h003680; 
assign halfXList[99] = 24'h003700; 
assign halfXList[100] = 24'h003780; 
assign halfXList[101] = 24'h003800; 
assign halfXList[102] = 24'h003880; 
assign halfXList[103] = 24'h003900; 
assign halfXList[104] = 24'h003980; 
assign halfXList[105] = 24'h003a00; 
assign halfXList[106] = 24'h003a80; 
assign halfXList[107] = 24'h003b00; 
assign halfXList[108] = 24'h003b80; 
assign halfXList[109] = 24'h003c00; 
assign halfXList[110] = 24'h003c80; 
assign halfXList[111] = 24'h003d00; 
assign halfXList[112] = 24'h003d80; 
assign halfXList[113] = 24'h003e00; 
assign halfXList[114] = 24'h003e80; 
assign halfXList[115] = 24'h003f00; 
assign halfXList[116] = 24'h003f80; 
assign halfXList[117] = 24'h004000; 
assign halfXList[118] = 24'h004080; 
assign halfXList[119] = 24'h004100; 
assign halfXList[120] = 24'h004180; 
assign halfXList[121] = 24'h004200; 
assign halfXList[122] = 24'h004280; 
assign halfXList[123] = 24'h004300; 
assign halfXList[124] = 24'h004380; 
assign halfXList[125] = 24'h004400; 
assign halfXList[126] = 24'h004480; 
assign halfXList[127] = 24'h004500; 
assign halfXList[128] = 24'h004580; 
assign halfXList[129] = 24'h004600; 
assign halfXList[130] = 24'h004680; 
assign halfXList[131] = 24'h004700; 
assign halfXList[132] = 24'h004780; 
assign halfXList[133] = 24'h004800; 
assign halfXList[134] = 24'h004880; 
assign halfXList[135] = 24'h004900; 
assign halfXList[136] = 24'h004980; 
assign halfXList[137] = 24'h004a00; 
assign halfXList[138] = 24'h004a80; 
assign halfXList[139] = 24'h004b00; 
assign halfXList[140] = 24'h004b80; 
assign halfXList[141] = 24'h004c00; 
assign halfXList[142] = 24'h004c80; 
assign halfXList[143] = 24'h004d00; 
assign halfXList[144] = 24'h004d80; 
assign halfXList[145] = 24'h004e00; 
assign halfXList[146] = 24'h004e80; 
assign halfXList[147] = 24'h004f00; 
assign halfXList[148] = 24'h004f80; 
assign halfXList[149] = 24'h005000; 
assign halfXList[150] = 24'h005080; 
assign halfXList[151] = 24'h005100; 
assign halfXList[152] = 24'h005180; 
assign halfXList[153] = 24'h005200; 
assign halfXList[154] = 24'h005280; 
assign halfXList[155] = 24'h005300; 
assign halfXList[156] = 24'h005380; 
assign halfXList[157] = 24'h005400; 
assign halfXList[158] = 24'h005480; 
assign halfXList[159] = 24'h005500; 
assign halfXList[160] = 24'h005580; 
assign halfXList[161] = 24'h005600; 
assign halfXList[162] = 24'h005680; 
assign halfXList[163] = 24'h005700; 
assign halfXList[164] = 24'h005780; 
assign halfXList[165] = 24'h005800; 
assign halfXList[166] = 24'h005880; 
assign halfXList[167] = 24'h005900; 
assign halfXList[168] = 24'h005980; 
assign halfXList[169] = 24'h005a00; 
assign halfXList[170] = 24'h005a80; 
assign halfXList[171] = 24'h005b00; 
assign halfXList[172] = 24'h005b80; 
assign halfXList[173] = 24'h005c00; 
assign halfXList[174] = 24'h005c80; 
assign halfXList[175] = 24'h005d00; 
assign halfXList[176] = 24'h005d80; 
assign halfXList[177] = 24'h005e00; 
assign halfXList[178] = 24'h005e80; 
assign halfXList[179] = 24'h005f00; 
assign halfXList[180] = 24'h005f80; 
assign halfXList[181] = 24'h006000; 
assign halfXList[182] = 24'h006100; 
assign halfXList[183] = 24'h006200; 
assign halfXList[184] = 24'h006300; 
assign halfXList[185] = 24'h006400; 
assign halfXList[186] = 24'h006500; 
assign halfXList[187] = 24'h006600; 
assign halfXList[188] = 24'h006700; 
assign halfXList[189] = 24'h006800; 
assign halfXList[190] = 24'h006900; 
assign halfXList[191] = 24'h006a00; 
assign halfXList[192] = 24'h006b00; 
assign halfXList[193] = 24'h006c00; 
assign halfXList[194] = 24'h006d00; 
assign halfXList[195] = 24'h006e00; 
assign halfXList[196] = 24'h006f00; 
assign halfXList[197] = 24'h007000; 
assign halfXList[198] = 24'h007100; 
assign halfXList[199] = 24'h007200; 
assign halfXList[200] = 24'h007300; 
assign halfXList[201] = 24'h007400; 
assign halfXList[202] = 24'h007500; 
assign halfXList[203] = 24'h007600; 
assign halfXList[204] = 24'h007700; 
assign halfXList[205] = 24'h007800; 
assign halfXList[206] = 24'h007900; 
assign halfXList[207] = 24'h007a00; 
assign halfXList[208] = 24'h007b00; 
assign halfXList[209] = 24'h007c00; 
assign halfXList[210] = 24'h007d00; 
assign halfXList[211] = 24'h007e00; 
assign halfXList[212] = 24'h007f00; 
assign halfXList[213] = 24'h008000; 
assign halfXList[214] = 24'h008100; 
assign halfXList[215] = 24'h008200; 
assign halfXList[216] = 24'h008300; 
assign halfXList[217] = 24'h008400; 
assign halfXList[218] = 24'h008500; 
assign halfXList[219] = 24'h008600; 
assign halfXList[220] = 24'h008700; 
assign halfXList[221] = 24'h008800; 
assign halfXList[222] = 24'h008900; 
assign halfXList[223] = 24'h008a00; 
assign halfXList[224] = 24'h008b00; 
assign halfXList[225] = 24'h008c00; 
assign halfXList[226] = 24'h008d00; 
assign halfXList[227] = 24'h008e00; 
assign halfXList[228] = 24'h008f00; 
assign halfXList[229] = 24'h009000; 
assign halfXList[230] = 24'h009100; 
assign halfXList[231] = 24'h009200; 
assign halfXList[232] = 24'h009400; 
assign halfXList[233] = 24'h009600; 
assign halfXList[234] = 24'h009800; 
assign halfXList[235] = 24'h009a00; 
assign halfXList[236] = 24'h009c00; 
assign halfXList[237] = 24'h009e00; 
assign halfXList[238] = 24'h00a000; 
assign halfXList[239] = 24'h00a200; 
assign halfXList[240] = 24'h00a400; 
assign halfXList[241] = 24'h00a600; 
assign halfXList[242] = 24'h00a800; 
assign halfXList[243] = 24'h00aa00; 
assign halfXList[244] = 24'h00ac00; 
assign halfXList[245] = 24'h00ae00; 
assign halfXList[246] = 24'h00b000; 
assign halfXList[247] = 24'h00b200; 
assign halfXList[248] = 24'h00b400; 
assign halfXList[249] = 24'h00b600; 
assign halfXList[250] = 24'h00b800; 
assign halfXList[251] = 24'h00ba00; 
assign halfXList[252] = 24'h00bc00; 
assign halfXList[253] = 24'h00be00; 
assign halfXList[254] = 24'h00c000; 
assign halfXList[255] = 24'h00c400; 
assign halfXList[256] = 24'h00c800; 
assign halfXList[257] = 24'h00cc00; 
assign halfXList[258] = 24'h00d000; 
assign halfXList[259] = 24'h00d400; 
assign halfXList[260] = 24'h00d800; 
assign halfXList[261] = 24'h00dc00; 
assign halfXList[262] = 24'h00e000; 
assign halfXList[263] = 24'h00e400; 
assign halfXList[264] = 24'h00e800; 
assign halfXList[265] = 24'h00f000; 
assign halfXList[266] = 24'h00f800; 
assign halfXList[267] = 24'h010000; 
assign halfXList[268] = 24'h010800; 
assign halfXList[269] = 24'h011000; 
assign halfXList[270] = 24'h012000; 
assign halfXList[271] = 24'h013000; 
assign halfXList[272] = 24'h014000; 
assign halfXList[273] = 24'h016000; 
assign halfXList[274] = 24'h018000; 
assign halfXList[275] = 24'h020000; 
assign halfXList[276] = 24'h040000; 

assign half_j = halfXList[j];
assign half_j_1 = halfXList[j + 1'b1];

endmodule