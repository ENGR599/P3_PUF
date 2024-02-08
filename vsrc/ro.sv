`timescale 1ns/1ps
module ro(en, roout);

    input en;
    output roout;

    wire [16:0] tmp /* synthesis syn_keep=1 dont_touch=1*/ ;

    notgate not_1(tmp[0], tmp[1]) /*synthesis syn_noprune=1dont_touch=1*/ ;
    nandgate nand_2(tmp[1], en, tmp[2]) /*synthesis syn_noprune=1 dont_touch=1*/ ;
    notgate not_3(tmp[2], tmp[3]) /*synthesis syn_noprune=1 dont_touch=1*/ ;
    notgate not_4(tmp[3], tmp[4]) /*synthesis syn_noprune=1 dont_touch=1*/ ;
    notgate not_5(tmp[4], tmp[5]) /*synthesis syn_noprune=1 dont_touch=1*/ ;
    notgate not_6(tmp[5], tmp[6]) /*synthesis syn_noprune=1 dont_touch=1*/ ;
    notgate not_7(tmp[6], tmp[7]) /*synthesis syn_noprune=1 dont_touch=1*/ ;
    notgate not_8(tmp[7], tmp[8]) /*synthesis syn_noprune=1 dont_touch=1*/ ;
    notgate not_9(tmp[8], tmp[0]) /*synthesis syn_noprune=1 dont_touch=1*/ ;

    assign roout = tmp[0];

endmodule
