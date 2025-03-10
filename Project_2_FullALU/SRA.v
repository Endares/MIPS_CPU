module SRA(a, ctrl_shiftamt, res);
    input [31:0] a;            
    input [4:0] ctrl_shiftamt;     
    output [31:0] res;  
	
    wire [31:0] s0, s1, s2, s3;

    // sign bit
    wire sign_bit = a[31];

    // 1st level (1-bit right)
    assign s0[31] = (ctrl_shiftamt[0]) ? sign_bit : a[31];  // retain sign bit
    assign s0[30] = (ctrl_shiftamt[0]) ? a[31] : a[30];
    assign s0[29] = (ctrl_shiftamt[0]) ? a[30] : a[29];
    assign s0[28] = (ctrl_shiftamt[0]) ? a[29] : a[28];
    assign s0[27] = (ctrl_shiftamt[0]) ? a[28] : a[27];
    assign s0[26] = (ctrl_shiftamt[0]) ? a[27] : a[26];
    assign s0[25] = (ctrl_shiftamt[0]) ? a[26] : a[25];
    assign s0[24] = (ctrl_shiftamt[0]) ? a[25] : a[24];
    assign s0[23] = (ctrl_shiftamt[0]) ? a[24] : a[23];
    assign s0[22] = (ctrl_shiftamt[0]) ? a[23] : a[22];
    assign s0[21] = (ctrl_shiftamt[0]) ? a[22] : a[21];
    assign s0[20] = (ctrl_shiftamt[0]) ? a[21] : a[20];
    assign s0[19] = (ctrl_shiftamt[0]) ? a[20] : a[19];
    assign s0[18] = (ctrl_shiftamt[0]) ? a[19] : a[18];
    assign s0[17] = (ctrl_shiftamt[0]) ? a[18] : a[17];
    assign s0[16] = (ctrl_shiftamt[0]) ? a[17] : a[16];
    assign s0[15] = (ctrl_shiftamt[0]) ? a[16] : a[15];
    assign s0[14] = (ctrl_shiftamt[0]) ? a[15] : a[14];
    assign s0[13] = (ctrl_shiftamt[0]) ? a[14] : a[13];
    assign s0[12] = (ctrl_shiftamt[0]) ? a[13] : a[12];
    assign s0[11] = (ctrl_shiftamt[0]) ? a[12] : a[11];
    assign s0[10] = (ctrl_shiftamt[0]) ? a[11] : a[10];
    assign s0[9]  = (ctrl_shiftamt[0]) ? a[10] : a[9];
    assign s0[8]  = (ctrl_shiftamt[0]) ? a[9]  : a[8];
    assign s0[7]  = (ctrl_shiftamt[0]) ? a[8]  : a[7];
    assign s0[6]  = (ctrl_shiftamt[0]) ? a[7]  : a[6];
    assign s0[5]  = (ctrl_shiftamt[0]) ? a[6]  : a[5];
    assign s0[4]  = (ctrl_shiftamt[0]) ? a[5]  : a[4];
    assign s0[3]  = (ctrl_shiftamt[0]) ? a[4]  : a[3];
    assign s0[2]  = (ctrl_shiftamt[0]) ? a[3]  : a[2];
    assign s0[1]  = (ctrl_shiftamt[0]) ? a[2]  : a[1];
    assign s0[0]  = (ctrl_shiftamt[0]) ? a[1]  : a[0];

    // 2nd level (2-bit right)
    assign s1[31] = (ctrl_shiftamt[1]) ? sign_bit : s0[31]; 
    assign s1[30] = (ctrl_shiftamt[1]) ? sign_bit : s0[30];
    assign s1[29] = (ctrl_shiftamt[1]) ? s0[31] : s0[29];
    assign s1[28] = (ctrl_shiftamt[1]) ? s0[30] : s0[28];
    assign s1[27] = (ctrl_shiftamt[1]) ? s0[29] : s0[27];
    assign s1[26] = (ctrl_shiftamt[1]) ? s0[28] : s0[26];
    assign s1[25] = (ctrl_shiftamt[1]) ? s0[27] : s0[25];
    assign s1[24] = (ctrl_shiftamt[1]) ? s0[26] : s0[24];
    assign s1[23] = (ctrl_shiftamt[1]) ? s0[25] : s0[23];
    assign s1[22] = (ctrl_shiftamt[1]) ? s0[24] : s0[22];
    assign s1[21] = (ctrl_shiftamt[1]) ? s0[23] : s0[21];
    assign s1[20] = (ctrl_shiftamt[1]) ? s0[22] : s0[20];
    assign s1[19] = (ctrl_shiftamt[1]) ? s0[21] : s0[19];
    assign s1[18] = (ctrl_shiftamt[1]) ? s0[20] : s0[18];
    assign s1[17] = (ctrl_shiftamt[1]) ? s0[19] : s0[17];
    assign s1[16] = (ctrl_shiftamt[1]) ? s0[18] : s0[16];
    assign s1[15] = (ctrl_shiftamt[1]) ? s0[17] : s0[15];
    assign s1[14] = (ctrl_shiftamt[1]) ? s0[16] : s0[14];
    assign s1[13] = (ctrl_shiftamt[1]) ? s0[15] : s0[13];
    assign s1[12] = (ctrl_shiftamt[1]) ? s0[14] : s0[12];
    assign s1[11] = (ctrl_shiftamt[1]) ? s0[13] : s0[11];
    assign s1[10] = (ctrl_shiftamt[1]) ? s0[12] : s0[10];
    assign s1[9]  = (ctrl_shiftamt[1]) ? s0[11] : s0[9];
    assign s1[8]  = (ctrl_shiftamt[1]) ? s0[10] : s0[8];
    assign s1[7]  = (ctrl_shiftamt[1]) ? s0[9]  : s0[7];
    assign s1[6]  = (ctrl_shiftamt[1]) ? s0[8]  : s0[6];
    assign s1[5]  = (ctrl_shiftamt[1]) ? s0[7]  : s0[5];
    assign s1[4]  = (ctrl_shiftamt[1]) ? s0[6]  : s0[4];
    assign s1[3]  = (ctrl_shiftamt[1]) ? s0[5]  : s0[3];
    assign s1[2]  = (ctrl_shiftamt[1]) ? s0[4]  : s0[2];
    assign s1[1]  = (ctrl_shiftamt[1]) ? s0[3]  : s0[1];
    assign s1[0]  = (ctrl_shiftamt[1]) ? s0[2]  : s0[0];

    // 3rd level (4-bit right)
    assign s2[31] = (ctrl_shiftamt[2]) ? sign_bit : s1[31];
    assign s2[30] = (ctrl_shiftamt[2]) ? sign_bit : s1[30];
    assign s2[29] = (ctrl_shiftamt[2]) ? sign_bit : s1[29];
    assign s2[28] = (ctrl_shiftamt[2]) ? sign_bit : s1[28];
    assign s2[27] = (ctrl_shiftamt[2]) ? s1[31] : s1[27];
    assign s2[26] = (ctrl_shiftamt[2]) ? s1[30] : s1[26];
    assign s2[25] = (ctrl_shiftamt[2]) ? s1[29] : s1[25];
    assign s2[24] = (ctrl_shiftamt[2]) ? s1[28] : s1[24];
    assign s2[23] = (ctrl_shiftamt[2]) ? s1[27] : s1[23];
    assign s2[22] = (ctrl_shiftamt[2]) ? s1[26] : s1[22];
    assign s2[21] = (ctrl_shiftamt[2]) ? s1[25] : s1[21];
    assign s2[20] = (ctrl_shiftamt[2]) ? s1[24] : s1[20];
    assign s2[19] = (ctrl_shiftamt[2]) ? s1[23] : s1[19];
    assign s2[18] = (ctrl_shiftamt[2]) ? s1[22] : s1[18];
    assign s2[17] = (ctrl_shiftamt[2]) ? s1[21] : s1[17];
    assign s2[16] = (ctrl_shiftamt[2]) ? s1[20] : s1[16];
    assign s2[15] = (ctrl_shiftamt[2]) ? s1[19] : s1[15];
    assign s2[14] = (ctrl_shiftamt[2]) ? s1[18] : s1[14];
    assign s2[13] = (ctrl_shiftamt[2]) ? s1[17] : s1[13];
    assign s2[12] = (ctrl_shiftamt[2]) ? s1[16] : s1[12];
    assign s2[11] = (ctrl_shiftamt[2]) ? s1[15] : s1[11];
    assign s2[10] = (ctrl_shiftamt[2]) ? s1[14] : s1[10];
    assign s2[9]  = (ctrl_shiftamt[2]) ? s1[13] : s1[9];
    assign s2[8]  = (ctrl_shiftamt[2]) ? s1[12] : s1[8];
    assign s2[7]  = (ctrl_shiftamt[2]) ? s1[11] : s1[7];
    assign s2[6]  = (ctrl_shiftamt[2]) ? s1[10] : s1[6];
    assign s2[5]  = (ctrl_shiftamt[2]) ? s1[9]  : s1[5];
    assign s2[4]  = (ctrl_shiftamt[2]) ? s1[8]  : s1[4];
    assign s2[3]  = (ctrl_shiftamt[2]) ? s1[7]  : s1[3];
    assign s2[2]  = (ctrl_shiftamt[2]) ? s1[6]  : s1[2];
    assign s2[1]  = (ctrl_shiftamt[2]) ? s1[5]  : s1[1];
    assign s2[0]  = (ctrl_shiftamt[2]) ? s1[4]  : s1[0];

    // 4th level (8-bit right)
    assign s3[31] = (ctrl_shiftamt[3]) ? sign_bit : s2[31];  
    assign s3[30] = (ctrl_shiftamt[3]) ? sign_bit : s2[30];
    assign s3[29] = (ctrl_shiftamt[3]) ? sign_bit : s2[29];
    assign s3[28] = (ctrl_shiftamt[3]) ? sign_bit : s2[28]; 
    assign s3[27] = (ctrl_shiftamt[3]) ? sign_bit : s2[27];
    assign s3[26] = (ctrl_shiftamt[3]) ? sign_bit : s2[26]; 
    assign s3[25] = (ctrl_shiftamt[3]) ? sign_bit : s2[25]; 
    assign s3[24] = (ctrl_shiftamt[3]) ? sign_bit : s2[24];  
    assign s3[23] = (ctrl_shiftamt[3]) ? s2[31] : s2[23];
    assign s3[22] = (ctrl_shiftamt[3]) ? s2[30] : s2[22];
    assign s3[21] = (ctrl_shiftamt[3]) ? s2[29] : s2[21];
    assign s3[20] = (ctrl_shiftamt[3]) ? s2[28] : s2[20];
    assign s3[19] = (ctrl_shiftamt[3]) ? s2[27] : s2[19];
    assign s3[18] = (ctrl_shiftamt[3]) ? s2[26] : s2[18];
    assign s3[17] = (ctrl_shiftamt[3]) ? s2[25] : s2[17];
    assign s3[16] = (ctrl_shiftamt[3]) ? s2[24] : s2[16];
    assign s3[15] = (ctrl_shiftamt[3]) ? s2[23] : s2[15];
    assign s3[14] = (ctrl_shiftamt[3]) ? s2[22] : s2[14];
    assign s3[13] = (ctrl_shiftamt[3]) ? s2[21] : s2[13];
    assign s3[12] = (ctrl_shiftamt[3]) ? s2[20] : s2[12];
    assign s3[11] = (ctrl_shiftamt[3]) ? s2[19] : s2[11];
    assign s3[10] = (ctrl_shiftamt[3]) ? s2[18] : s2[10];
    assign s3[9]  = (ctrl_shiftamt[3]) ? s2[17] : s2[9];
    assign s3[8]  = (ctrl_shiftamt[3]) ? s2[16] : s2[8];
    assign s3[7]  = (ctrl_shiftamt[3]) ? s2[15] : s2[7];
    assign s3[6]  = (ctrl_shiftamt[3]) ? s2[14] : s2[6];
    assign s3[5]  = (ctrl_shiftamt[3]) ? s2[13] : s2[5];
    assign s3[4]  = (ctrl_shiftamt[3]) ? s2[12] : s2[4];
    assign s3[3]  = (ctrl_shiftamt[3]) ? s2[11] : s2[3];
    assign s3[2]  = (ctrl_shiftamt[3]) ? s2[10] : s2[2];
    assign s3[1]  = (ctrl_shiftamt[3]) ? s2[9]  : s2[1];
    assign s3[0]  = (ctrl_shiftamt[3]) ? s2[8]  : s2[0];
	 
	 // 5th level (16-bit right)
    assign res[31] = (ctrl_shiftamt[4]) ? sign_bit : s3[31];
    assign res[30] = (ctrl_shiftamt[4]) ? sign_bit : s3[30];
    assign res[29] = (ctrl_shiftamt[4]) ? sign_bit : s3[29];
    assign res[28] = (ctrl_shiftamt[4]) ? sign_bit : s3[28];
    assign res[27] = (ctrl_shiftamt[4]) ? sign_bit : s3[27];
    assign res[26] = (ctrl_shiftamt[4]) ? sign_bit : s3[26];
    assign res[25] = (ctrl_shiftamt[4]) ? sign_bit : s3[25];
    assign res[24] = (ctrl_shiftamt[4]) ? sign_bit : s3[24];
    assign res[23] = (ctrl_shiftamt[4]) ? sign_bit : s3[23];
    assign res[22] = (ctrl_shiftamt[4]) ? sign_bit : s3[22];
    assign res[21] = (ctrl_shiftamt[4]) ? sign_bit : s3[21];
    assign res[20] = (ctrl_shiftamt[4]) ? sign_bit : s3[20];
    assign res[19] = (ctrl_shiftamt[4]) ? sign_bit : s3[19];
    assign res[18] = (ctrl_shiftamt[4]) ? sign_bit : s3[18];
    assign res[17] = (ctrl_shiftamt[4]) ? sign_bit : s3[17];
    assign res[16] = (ctrl_shiftamt[4]) ? sign_bit : s3[16];
    assign res[15] = (ctrl_shiftamt[4]) ? s3[31] : s3[15];
    assign res[14] = (ctrl_shiftamt[4]) ? s3[30] : s3[14];
    assign res[13] = (ctrl_shiftamt[4]) ? s3[29] : s3[13];
    assign res[12] = (ctrl_shiftamt[4]) ? s3[28] : s3[12];
    assign res[11] = (ctrl_shiftamt[4]) ? s3[27] : s3[11];
    assign res[10] = (ctrl_shiftamt[4]) ? s3[26] : s3[10];
    assign res[9]  = (ctrl_shiftamt[4]) ? s3[25] : s3[9];
    assign res[8]  = (ctrl_shiftamt[4]) ? s3[24] : s3[8];
    assign res[7]  = (ctrl_shiftamt[4]) ? s3[23] : s3[7];
    assign res[6]  = (ctrl_shiftamt[4]) ? s3[22] : s3[6];
    assign res[5]  = (ctrl_shiftamt[4]) ? s3[21] : s3[5];
    assign res[4]  = (ctrl_shiftamt[4]) ? s3[20] : s3[4];
    assign res[3]  = (ctrl_shiftamt[4]) ? s3[19] : s3[3];
    assign res[2]  = (ctrl_shiftamt[4]) ? s3[18] : s3[2];
    assign res[1]  = (ctrl_shiftamt[4]) ? s3[17] : s3[1];
    assign res[0]  = (ctrl_shiftamt[4]) ? s3[16] : s3[0];


endmodule
