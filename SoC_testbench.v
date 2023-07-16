`timescale 1ns / 1ns

module SoC_Testbench;

  // Parameters
  parameter CLK_PERIOD = 10;

  // Signals
  reg clk;
  reg reset;
  reg dma_request;
  wire dma_ack;
  reg [31:0] memory_address;
  reg [31:0] memory_data_in;
  wire [31:0] memory_data_out;
  wire memory_write_enable;
  reg [7:0] peripheral_data_in;
  wire [7:0] peripheral_data_out;

  // Instantiate the SoC module
  SoC dut (
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

  // Clock Generation
  always begin
    #((CLK_PERIOD) / 2) clk = ~clk;
  end

  // Initialize signals
  initial begin
    clk = 0;
    reset = 1;
    dma_request = 0;
    memory_address = 0;
    memory_data_in = 0;
    peripheral_data_in = 0;
    
    // Reset SoC
    #100 reset = 0;
  end

  // Generate DMA request
  initial begin
    // Wait for reset to complete
    @(posedge clk);
    @(posedge clk);
    
    // Enable DMA request
    dma_request = 1;
    
    // Wait for acknowledgment
    @(posedge dma_ack);
    
    // Generate data to transfer
    memory_address = 0;
    memory_data_in = 32'h12345678;
    
    // Wait for transfer to complete
    @(posedge dma_ack);
    
    // Disable DMA request
    dma_request = 0;
    
    // Verify the transferred data
    if (memory_data_out === memory_data_in)
      $display("Data transfer successful: %h", memory_data_out);
    else
      $display("Data transfer failed!");
    
    // Generate data from peripherals
    peripheral_data_in = 8'hAB;
    
    // Wait for transfer to complete
    @(posedge clk);
    @(posedge clk);
    
    // Verify the transferred data
    if (peripheral_data_out === peripheral_data_in)
      $display("Peripheral data transfer successful: %h", peripheral_data_out);
    else
      $display("Peripheral data transfer failed!");
    
    // End simulation
    $finish;
  end

endmodule
