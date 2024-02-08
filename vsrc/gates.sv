module nandgate(input a, input b, output c);

    wire nand_temp;
    LUT2 #( 
        .INIT(4'h7)
    ) nand0(
        .O(nand_temp),
        .I0(a),
        .I1(b) 
    );
    assign c = nand_temp;    

endmodule




module notgate(input a, output b);
    assign b = ~a;
endmodule




module buffer(input a, output b);
    
    wire buf_temp;
    LUT1 #(
        .INIT(2'h1) 
    ) buf0(
        .I0(a),
        .O(buf_temp)
    );
    assign b = buf_temp;

endmodule


