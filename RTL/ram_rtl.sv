`define ADDR_WIDTH 6
`define DEPTH 64
`define DATA_WIDTH 8
 
module ram (
    input clk,
    input rstn,
 
    // write signals
    input wr_enb,
    input [`ADDR_WIDTH-1:0] wr_addr,
    input [`DATA_WIDTH-1:0] wr_data,
 
    // read signals
    input rd_enb,
    input [`ADDR_WIDTH-1:0] rd_addr,
    output reg [`DATA_WIDTH-1:0] rd_data
);
 
    // internal memory
    reg [`DATA_WIDTH-1:0] ram [0:`DEPTH-1];
    integer i;
 
    // logic
    always @(posedge clk) begin
        if (!rstn) begin
            rd_data <= 0;
            for (i = 0; i < `DEPTH; i = i + 1)
                ram[i] <= 0;
        end else begin
            if (wr_enb)
                ram[wr_addr] <= wr_data;
 
            if (rd_enb)
                rd_data <= ram[rd_addr];
        end
    end
endmodule
