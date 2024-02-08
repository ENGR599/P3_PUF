module top(

    input CLK100MHZ,
    input btnC,
    input [7:0] sw,
    output [1:0] LED
);

wire [255:0] ROUTS0 /* synthesis syn_keep=true */ ;
wire [255:0] ROUTS1 /* synthesis syn_keep=true */ ;
reg ROEN0 /* synthesis syn_preserve=true */ ;
reg ROEN1 /* synthesis syn_preserve=true */ ;

assign ROEN0 = btnC; //'h1;
assign ROEN1 = btnC; //'h1;

logic [7:0] chall0 = sw; //8'h1;
logic [7:0] chall1 = sw; //8'h1;

wire muxout0;
wire muxout1;

assign LED[0] = muxout0;
assign LED[1] = muxout1;

parameter ro_no = 256; // stage of ROs
genvar i;

generate
for (i=0 ; i< ro_no ; i=i+1 ) 	
begin: ro_block		
    /* dont_touch=true keep_hierarchy=true */ ro r0( .en(ROEN0), .roout(ROUTS0 [i]) );
    /* dont_touch=true keep_hierarchy=true */ ro r1( .en(ROEN1), .roout(ROUTS1 [i]) );
end
endgenerate


PUFMux256 mux0(ROUTS0[255:0], chall0, muxout0);
PUFMux256 mux1(ROUTS1[255:0], chall1, muxout1);

endmodule
