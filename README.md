# System-on-Chip-project
# Overview
This project aims to design and implement a System-on-Chip (SoC) that integrates multiple modules, including a DMA Controller, on-chip SRAM, an Interconnect/Bridge, and peripheral modules like SPI or I2C. The SoC is designed to address the challenges of operating on different clocks and having different interfaces.

The project showcases the implementation of an advanced SoC architecture that supports data transfers, addressing, DMA requests, acknowledgments, arbitration between multiple modules, priority handling, error detection/correction mechanisms, and more. It serves as a platform to explore and understand the nuances and design principles involved in building a full-featured SoC.

# Modules
DMA Controller
The DMA Controller module provides efficient data transfers between various modules within the SoC. It handles DMA requests, manages data movement between memory and peripherals, and ensures reliable and high-speed transfers. The DMA Controller is designed to optimize data throughput and minimize CPU intervention.

# On-Chip SRAM
The On-Chip SRAM module provides fast and low-latency memory access for the SoC. It acts as a temporary storage for data during processing and facilitates efficient data exchange between different modules. The On-Chip SRAM is designed to meet the performance requirements of the system while conserving power and minimizing area usage.

# Interconnect/Bridge
The Interconnect/Bridge module serves as a communication backbone for the SoC, enabling inter-module data transfer and synchronization. It handles the routing of data and control signals between various modules and supports a scalable and efficient interconnect architecture. The Interconnect/Bridge incorporates arbitration, prioritization, and error detection/correction mechanisms to ensure reliable and efficient communication.

# Peripheral Modules (SPI, I2C, etc.)
The project includes peripheral modules such as SPI and I2C, which provide interfaces for connecting external devices or peripherals to the SoC. These modules enable data exchange and communication with devices outside the SoC and enhance the system's functionality and connectivity.
