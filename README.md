## System-on-Chip-project
# Overview
This project aims to design and implement a System-on-Chip (SoC) that integrates multiple modules, including a DMA Controller, on-chip SRAM, an Interconnect/Bridge, and peripheral modules like SPI or I2C. The SoC is designed to address the challenges of operating on different clocks and having different interfaces.

The project showcases the implementation of an advanced SoC architecture that supports data transfers, addressing, DMA requests, acknowledgments, arbitration between multiple modules, priority handling, error detection/correction mechanisms, and more. It serves as a platform to explore and understand the nuances and design principles involved in building a full-featured SoC.

# Modules
DMA Controller
The DMA Controller module provides efficient data transfers between various modules within the SoC. It handles DMA requests, manages data movement between memory and peripherals, and ensures reliable and high-speed transfers. The DMA Controller is designed to optimize data throughput and minimize CPU intervention.

# On-Chip SRAM
The On-Chip SRAM module provides fast and low-latency memory access for the SoC. It acts as a temporary storage for data during processing and facilitates efficient data exchange between different modules. The On-Chip SRAM is designed to meet the performance requirements of the system while conserving power and minimizing area usage.
