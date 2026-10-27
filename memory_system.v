
module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);

    // This should instantiate 4 instances of
    // byte_memory, and then demultiplex
    // data and store into the one selected by
    // addr

    // It should then multiplex the output of the
    // memory specified by addr into the memory
    // output for display on the LEDs

    // Wires for the four memory blocks
    wire [7:0] data1, data2, data3, data4;
    wire store1, store2, store3, store4;
    wire [7:0] mem1, mem2, mem3, mem4;

byte_memory MEMORY1(
    .data(data1),
    .store(store1),
    .memory(mem1)
);

byte_memory MEMORY2(
    .data(data2),
    .store(store2),
    .memory(mem2)
);

byte_memory MEMORY3(
    .data(data3),
    .store(store3),
    .memory(mem3)
);

byte_memory MEMORY4(
    .data(data4),
    .store(store4),
    .memory(mem4)
);


    // you will need 2 demultiplexers:
    // 1. Demultiplex data -> selected byte
    // 2. Demultiplex store -> selected byte

data_demux DATA_DEMUX(
    .In(data),
    .Sel(addr),
    .Enable(1'b1),
    .data1(data1),
    .data2(data2),
    .data3(data3),
    .data4(data4)
);

store_demux STORE_DEMUX(
    .In(store),
    .Sel(addr),
    .store1(store1),
    .store2(store2),
    .store3(store3),
    .store4(store4)
);

    // and one multiplexer:
    // 1. Multiplex selected byte -> memory

mux OUTPUT_MUX(
    .Data1(mem1),
    .Data2(mem2),
    .Data3(mem3),
    .Data4(mem4),
    .Sel(addr),
    .Enable(1'b1),
    .Y(memory)
);

endmodule
