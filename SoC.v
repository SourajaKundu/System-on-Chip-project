// DMA Controller module
module DMA_Controller (
  // Input and output ports
  input wire clk,
  input wire reset,
  // DMA control signals
  input wire dma_request,
  output wire dma_ack,
  // Memory interface signals
  input wire [31:0] memory_address,
  input wire [31:0] memory_data_in,
  output wire [31:0] memory_data_out,
  output wire memory_write_enable,
  // Peripheral interface signals
  input wire [7:0] peripheral_data_in,
  output wire [7:0] peripheral_data_out
);
  // DMA Controller implementation
  // (Add your DMA Controller logic here)
endmodule

// On-Chip SRAM module
module On_Chip_SRAM (
  // Input and output ports
  input wire clk,
  input wire reset,
  // Memory interface signals
  input wire [31:0] address,
  input wire [31:0] data_in,
  output wire [31:0] data_out,
  output wire write_enable
);
  // On-Chip SRAM implementation
  // (Add your On-Chip SRAM logic here)
endmodule

// Interconnect/Bridge module
module Interconnect_Bridge (
  // Input and output ports
  input wire clk,
  input wire reset,
  // DMA control signals
  input wire dma_request,
  output wire dma_ack,
  // Memory interface signals
  input wire [31:0] memory_address,
  input wire [31:0] memory_data_in,
  output wire [31:0] memory_data_out,
  output wire memory_write_enable,
  // Peripheral interface signals
  input wire [7:0] peripheral_data_in,
  output wire [7:0] peripheral_data_out
);
  // Interconnect/Bridge implementation
  // (Add your Interconnect/Bridge logic here)
endmodule

// Peripheral modules
module SPI (
  // Input and output ports
  input wire clk,
  input wire reset,
  // SPI interface signals
  input wire [7:0] data_in,
  output wire [7:0] data_out
);
  // SPI implementation
  // (Add your SPI logic here)
endmodule

module I2C (
  // Input and output ports
  input wire clk,
  input wire reset,
  // I2C interface signals
  input wire [7:0] data_in,
  output wire [7:0] data_out
);
  // I2C implementation
  // (Add your I2C logic here)
endmodule

// Top-level SoC module
module SoC (
  // Input and output ports
  input wire clk,
  input wire reset,
  // DMA control signals
  input wire dma_request,
  output wire dma_ack,
  // Memory interface signals
  input wire [31:0] memory_address,
  input wire [31:0] memory_data_in,
  output wire [31:0] memory_data_out,
  output wire memory_write_enable,
  // Peripheral interface signals
  input wire [7:0] peripheral_data_in,
  output wire [7:0] peripheral_data_out
);
  // Instantiate DMA Controller
  DMA_Controller dma_controller (
    .clk(clk),
    .reset(reset),
    .dma_request(dma_request),
    .dma_ack(dma_ack),
    .memory_address(memory_address),
    .memory_data_in(memory_data_in),
    .memory_data_out(memory_data_out),
    .memory_write_enable(memory_write_enable),
    .peripheral_data_in(peripheral_data_in),
    .peripheral_data_out(peripheral_data_out)
  );

  // Instantiate On-Chip SRAM
  On_Chip_SRAM on_chip_sram (
    .clk(clk),
    .reset(reset),
    .address(memory_address),
    .data_in(memory_data_in),
    .data_out(memory_data_out),
    .write_enable(memory_write_enable)
  );

  // Instantiate Interconnect/Bridge
  Interconnect_Bridge interconnect_bridge (
    .clk(clk),
    .reset(reset),
    .dma_request(dma_request),
    .dma_ack(dma_ack),
    .memory_address(memory_address),
    .memory_data_in(memory_data_in),
    .memory_data_out(memory_data_out),
    .memory_write_enable(memory_write_enable),
    .peripheral_data_in(peripheral_data_in),
    .peripheral_data_out(peripheral_data_out)
  );

  // Instantiate Peripheral modules
  SPI spi (
    .clk(clk),
    .reset(reset),
    .data_in(peripheral_data_in),
    .data_out(peripheral_data_out)
  );

  I2C i2c (
    .clk(clk),
    .reset(reset),
    .data_in(peripheral_data_in),
    .data_out(peripheral_data_out)
  );

  // Data Transfer between On-Chip SRAM and Peripheral devices
  wire [31:0] sram_data;
  wire sram_write_enable;
  
  assign sram_data = on_chip_sram.data_out;
  assign on_chip_sram.data_in = sram_data;
  
  // Transfer data from On-Chip SRAM to Peripheral devices
  assign spi.data_out = sram_data[7:0];
  assign i2c.data_out = sram_data[7:0];
  
  // Transfer data from Peripheral devices to On-Chip SRAM
  assign on_chip_sram.data_in = {24'h0, spi.data_in};
  assign on_chip_sram.data_in = {24'h0, i2c.data_in};

endmodule
