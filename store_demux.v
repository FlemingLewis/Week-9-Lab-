module store_demux(

output store1,
output store2,
output store3,
output store4,
input In,
input [1:0] Sel

);
 
assign store1 = (Sel == 2'b00 ? In : 1'b0); // Drive Y1 if Sel == 0
assign store2 = (Sel == 2'b01 ? In : 1'b0);
assign store3 = (Sel == 2'b10 ? In : 1'b0);
assign store4 = (Sel == 2'b11 ? In : 1'b0); // Drive Y2 if Sel == 1
   

endmodule

