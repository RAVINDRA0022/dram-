`timescale 1ns / 1ps

module DRAM (
    input wire clk,           
    input wire word_line,    
    input wire bit_line,     
    input wire read_en,      
    input wire write_en,     
    input wire refresh,      
    output wire data_out      
);

    reg cell_data;  

    always @(posedge clk) begin
        if (write_en && word_line) begin
            cell_data <= bit_line;
        end
        else if (refresh && word_line) begin
            cell_data <= cell_data;
        end
    end

    assign data_out = (read_en && word_line) ? cell_data : 1'bz; 
endmodule
