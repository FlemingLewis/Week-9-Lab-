module mux(
    input [7:0] Data1,
    input [7:0] Data2,
    input [7:0] Data3,
    input [7:0] Data4,
    input [1:0] Sel,
    input Enable,
    output [7:0] Y
);

    assign Y = (Sel == 2'b00 ? Data1 :
                Sel == 2'b01 ? Data2 :
                Sel == 2'b10 ? Data3 : Data4) & {8{Enable}};

endmodule

