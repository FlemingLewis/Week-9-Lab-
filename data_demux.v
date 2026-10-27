module data_demux(

output [7:0] data1,
output [7:0] data2,
output [7:0] data3,
output [7:0] data4,
input [7:0] In,
input [1:0] Sel,
input Enable

);
 
assign data1 = (Enable && Sel == 2'b00 ? In : 8'b00000000); // Drive Y1 if Sel == 0
assign data2 = (Enable && Sel == 2'b01 ? In : 8'b00000000);
assign data3 = (Enable && Sel == 2'b10 ? In : 8'b00000000);
assign data4 = (Enable && Sel == 2'b11 ? In : 8'b00000000); // Drive Y2 if Sel == 1
   

endmodule


