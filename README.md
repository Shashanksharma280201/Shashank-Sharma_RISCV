# Shashank-Sharma_RISCV


# Makerchip

Navigate to [Makerchip](https://www.makerchip.com/sandbox/)  IDE

Makerchip is a web-based platform for digital design and development. It provides tools and resources for creating and simulating digital circuits and systems, with a focus on the development of custom microprocessors and system-on-chip (SoC) designs. Makerchip offers a collaborative and integrated environment that includes a code editor, a simulator, and various libraries for hardware description and simulation.

- **SystemVerilog Support**: Makerchip allows users to write and simulate digital designs using the SystemVerilog hardware description language, making it suitable for both     beginners and experienced designers.
- **RISC-V and Custom Microprocessor Design**: It provides tools for designing custom RISC-V processors or creating entirely new microprocessor architectures.
- **Code Simulation**: Users can simulate their designs to test functionality and identify potential issues before moving on to the actual hardware implementation.
- **Collaboration**: Makerchip supports collaborative work, enabling multiple users to work on the same project simultaneously.
- **Online Platform**: As a web-based tool, Makerchip eliminates the need for users to install and maintain specialized software, making it accessible from various   devices with an internet connection.


# Lab

<details>
  <summary> Day 1 - Introduction to RISCV ISA and GNU Compiler Toolchain </summary>
  <br>

  # DAY-1: LAB work for RISC-V software toolchain
  ## Task 1
  
  ## Write a C program to compute sum from 1 to n
  ![Screenshot from 2023-08-19 11-20-30](https://github.com/Shashanksharma280201/PESU-ASIC/assets/79470436/3ee921a8-140c-4353-aac7-104b2f6c5168)
  
  ### The result for the above after gcc compilation 
  ![Screenshot from 2023-08-19 11-20-59](https://github.com/Shashanksharma280201/PESU-ASIC/assets/79470436/d89ef2d4-9315-4643-957c-63d027004a1b)
  
  ### commands used 
  ```
  gcc sum1ton.c
  ./a.out
  ```
  
  ## GCC compile And Disassemble 
  
  ![Screenshot from 2023-08-21 00-52-48](https://github.com/Shashanksharma280201/PESU-ASIC/assets/79470436/0033f39e-f64d-439c-965b-2c9185d6bdc3)
  ![Screenshot from 2023-08-21 00-45-38](https://github.com/Shashanksharma280201/PESU-ASIC/assets/79470436/6b067ff8-dada-4462-b6ec-2647c6690a94)
  
  
  ### Commands used to compile and get the outout
  ```
  riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o sum1ton.o sum1ton.c
  riscv64-unknown-elf-objdump -d sum1ton.o | less
  
  riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o sum1ton.o sum1ton.c
  riscv64-unknown-elf-objdump -d sum1ton.o | less
  ```
  ![Screenshot from 2023-08-21 00-56-27](https://github.com/Shashanksharma280201/PESU-ASIC/assets/79470436/0a321df3-eb8e-4eda-be6d-2d651332630a)
  
  
  ## Spike Simulation And Debug
  
  ### commands to run the risc-v compiler and spike debugger 
  ```
  riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o sum1ton.o sum1ton.c
  spike pk sum1ton.o
  spike -d pk sum1ton.o
  ```
  
  ### The outputs after running the above commands are:
  
  ![Screenshot from 2023-08-21 01-03-17](https://github.com/Shashanksharma280201/PESU-ASIC/assets/79470436/08502c60-1b52-43d1-b24f-06bed6d8a44f)
  
  
  ![Screenshot from 2023-08-21 01-07-25](https://github.com/Shashanksharma280201/PESU-ASIC/assets/79470436/6ab2a91e-47d9-4a3d-984a-82a3c50bb404)
  
  
  
  ## Task 2
  
  ## Write a C program for Signed And Unsigned Numbers 
  
  ![Screenshot from 2023-08-21 01-19-18](https://github.com/Shashanksharma280201/PESU-ASIC/assets/79470436/0b1c01e9-04df-4c78-97ba-6675715996ba)
  
  ## After running the compiler
  
  ![Screenshot from 2023-08-21 01-20-43](https://github.com/Shashanksharma280201/PESU-ASIC/assets/79470436/ba0825a6-1319-4d7a-a3ec-95b8ebdd2168)
  
  ### The commands for above porcess are:
  ```
  vim unsignedHighest.c
  riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o unsignedHighest.o unsignedHighest.c
  spike pk unsignedHighest.o
  ```
  
  ## For the signed number 
  
  ![Screenshot from 2023-08-21 01-28-57](https://github.com/Shashanksharma280201/PESU-ASIC/assets/79470436/2efbf598-7a24-4f71-a3ba-6a7bc3d41d35)
  
  ## After running the compiler
  
  ![Screenshot from 2023-08-21 01-28-48](https://github.com/Shashanksharma280201/PESU-ASIC/assets/79470436/0c63fe28-1cc8-476e-adfd-9387bd020663)
  
  
  ### The commands for above porcess are:
  
  ```
  vim signedHighest.c
  riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o signedHighest.o signedHighest.c
  spike pk signedHighest.o
  ```
</details>

<details>
  <summary> Day 2 - Introduction to ABI and Basic Verification Flow </summary>
  <br>
  
  ## Lab work using ABI function calls
  
  ### Download the load.S , 1to9_count.c files from 
  https://github.com/kunalg123/riscv_workshop_collaterals/tree/master/labs
  
  
  ```
  cat 1to9_custom.c
  cat load.S
  ```
   
  ### The above commands are used to view the content of the files on terminal
  
  ![Screenshot from 2023-08-21 01-49-31](https://github.com/Shashanksharma280201/PESU-ASIC/assets/79470436/4ec9fd68-5f28-4043-9571-f610346eff63)
  
  
  ![Screenshot from 2023-08-21 09-11-11](https://github.com/Shashanksharma280201/PESU-ASIC/assets/79470436/674d5a42-c54d-4803-94a1-0e2276a6dd91)
  
  ![Screenshot from 2023-08-21 09-10-32](https://github.com/Shashanksharma280201/PESU-ASIC/assets/79470436/3bd596ac-744e-4925-9f45-b27a44eab3b5)
  
  ### Command used :
  
  ```
  riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o 1to9_custom.o 1to9_custom.c load.S
  spike pk 1to9_custom.o
  riscv64-unknown-elf-objdump -d 1to9_custom.o | less
  ```
</details>


<details>
  <summary> Day 3 - Digital Logic with TL-Verilog and Makerchip </summary>
  <br>

## A) Inverter in TLV using command

- under TLV Section type ```$out = ! $in1``` and ```  $out2 = ($in2 ^ $in3) ```
- Now compile 

## B) Xor gate using operators

![Screenshot from 2023-10-16 22-59-07](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/2346af08-c49a-42f4-8e88-a6c5c6919d54)

## C) Vectors

![Screenshot from 2023-10-16 23-01-45](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/72c8cc28-6392-437c-87f8-b6060dd8a99d)

## D) Mux (with and without vectors)

![Screenshot from 2023-10-16 23-04-17](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/a2b129a8-6e26-46cf-93b9-4e6b668a0d81)

## E) Simple Claculator

![Screenshot from 2023-10-16 23-08-48](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/de1f7fba-7dd2-4cec-b078-21f80302eb71)

## Sequential logic

- **Basic Building Blocks**: Sequential logic blocks are made from digital gates and flip-flops.

- **Information Storage**: They store and process data over time, using the previous state and current input.

- **Stateful Operation**: Sequential logic blocks retain state, unlike combinational logic.

- **Flip-Flops**: Common storage elements in various types, like D, JK, and T flip-flops.

- **Clock Control**: Typically use a clock signal for timing operations.

- **Synchronous/Asynchronous**: Can be synchronous (clock-driven) or asynchronous (not clock-driven).

- **State Machines**: Used for implementing finite state machines (FSMs).

- **Control Logic**: Accompanies sequential blocks to manage data updates and responses.

- **Timing Analysis**: Timing is crucial for proper operation and to avoid hazards.

- **Applications**: Used in various systems, from registers to microprocessors.



## F) Fibonacci series

![Screenshot from 2023-10-16 23-21-35](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/deb0dbdf-923b-4320-8e6d-0bfafc6a9d8f)

## G) Up-Counter

![Screenshot from 2023-10-16 23-23-01](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/a7e4db08-01b9-40cd-82a6-7c786b5f8c7b)

## H) Sequential Calculator

![Screenshot from 2023-10-16 23-30-14](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/2eddc312-83ee-4809-95a5-a76e232afa00)

## I) A simple pipeline through Pythagorean example

![Screenshot from 2023-10-16 23-35-20](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/7814199c-0273-4f97-aa07-ca9c9aaf158c)


## J) Pipeline Implementation example

![Screenshot from 2023-10-16 23-38-54](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/d4a0d454-725e-4949-8124-9d41b076a413)

## Validity 
- Easier debug
- cleaner design
- Better error checking
- Automated clock gating

## K) 2 cycle calculator with validity

![Screenshot from 2023-10-16 23-51-54](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/2ab65e8c-c456-4ec8-bec7-cfa6f94c5836)


## L) Distance Calculator

![Screenshot from 2023-10-17 00-03-01](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/3bafce24-6f6a-42eb-bc32-13dbc1063c8f)

## M) Calulator_memory

![Screenshot from 2023-10-17 00-08-11](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/64a69828-3b1c-4394-880a-6e7b8c2e52b3)

</details>


<details>
  <summary> Day 4 - Basic RISC-V CPU micro-architecture </summary>
  <br>

  # Basic RISC-V CPU micro-architecture 


- **Load-Store Architecture**: RISC-V uses a load-store architecture, performing operations on registers and loading/storing data separately.

- **Fixed Instruction Length**: Instructions are of fixed length (usually 32 bits), simplifying instruction fetch.

- **Register File**: A small set of general-purpose registers (typically 32) is directly accessible.

- **Reduced Instruction Set**: RISC-V has a simplified, reduced instruction set for straightforward decoding and execution.

- **Pipelining**: RISC-V CPUs often employ pipelining for improved instruction throughput.

- **Memory Hierarchy**: Memory access uses a hierarchy including caches to reduce latency.

- **Branch and Jump Instructions**: Branch and jump instructions control program flow.

- **Single-Cycle Execution**: Many instructions are designed to execute in a single clock cycle.

- **32-bit and 64-bit Variants**: RISC-V supports both 32-bit (RV32) and 64-bit (RV64) instruction set variants.

- **Open Source**: RISC-V is open-source, encouraging collaboration and innovation in processor design.

  

  ## 1. Program Counter

  ![Screenshot from 2023-10-17 11-31-41](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/c28ce5c1-f01e-4a6f-8f1b-cda8cd9c4f70)


  ## 2. Instruction Fetch

  ![image](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/2041f022-1dc0-42b3-9b61-aa2d8280ebbc)

  ## 3.Instruction Decode

  ![image](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/28d078c9-85c9-4ee8-82b5-0abd77e5b566)

  ## 4. Instruction Decode with validity

  ![image](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/d6e97580-1b56-446b-adf4-6a242a4d49be)

  ## 5. Individual Instruction decode

  ![image](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/426300dc-859a-4087-9e20-6d3920d805fa)

  ## 6. Register file read

  ![image](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/c95ccaff-ccee-4402-b37b-bbac5dad38a0)

  ## 7. ALU
 
  ![image](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/91bb038b-ad5f-4d79-99b6-dd430013a9d5)

  ## 8. Register File Write

  ![image](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/ef452da7-502d-478b-916c-3b61e9e7ab55)

  ## 9. Branch Instructions

  ![image](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/75347919-6321-4b66-9654-4b525d6250f5)

  ## 10. Testbench to check functionality

  ![image](https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/6d3f81cc-55c5-4a69-811f-ca55137a8ee9)
</details>


<details>
  <summary> Day 5 - Complete Pipelined RISC-V CPU micro-architecture </summary>
  <br>
 ## 3-cycle RISCV
 
  
</details>











## Steps to install openlane2
Follow the steps on my repository [openlane_2_installation](https://github.com/Shashanksharma280201/openlane_2_installation)
