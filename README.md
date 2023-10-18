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

- under TLV Section type ```$out = ! $in1```
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
  <summary>Day 5 - Complete Pipelined RISC-V CPU micro-architecture </summary>
  <br>

 ## Pipelining the CPU
 
 
 - 3-Cycle Valid Signal

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/41e2f1cf-bccd-4cf4-9488-44af54752bbf" width="300">

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/bea13ef3-3f61-4eb9-8472-71f744208666" width="300">



- Taking care of Invalid Cycles

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/76b15832-4e5a-4db4-9164-74fcc186a60b" width="300">

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/2c98fa90-fa65-4fe3-b9bf-6f680c1ea606" width="300">



- Modify 3-cycle RISC-V to Distribute Logic

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/1b359689-5e1f-4445-9c57-2795dd381dcf" width="300">

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/ebce85f7-1452-4ad1-a8cc-b801b6169e4f" width="300">




## Solutions to Pipeline Hazards

- Register File Bypass

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/2e9c4d22-9907-41a2-abdf-68580b309fdd" width="300">

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/0ae686d6-960c-4ceb-94c1-80fab7a82033" width="300">

- Correct Branch Target Path

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/fc7863fc-b5b1-4384-ba6d-83c0bf774a41" width="300">

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/1abaad96-3360-4769-a668-402ac66b6929" width="300">


- Complete Instruction Decode

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/75342cbd-2cec-4c1d-bf4b-da1668fed4ee" width="300">

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/da07e19f-8e5d-4a93-8df1-fab3f681c198" width="300">

- Complete ALU

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/3e5ffd37-2789-4ec9-8f75-18d864d94a94" width="300">

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/6dbd3734-2668-40a4-932f-9ee078796431" width="300">


## Load & Store Instructions and Completing RISC-V CPU

- Redirect Loads

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/04f3e64b-f80f-4d3e-b006-0b9333bfba1d" width="300">

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/203d151b-5602-4c8f-af33-dda6903a490d" width="300">

- Load Data From Memory to Register File

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/bc40e8e9-b046-4068-95f4-bebce82b1cc0" width="300">

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/537070d0-3ccb-4186-8b4b-0bc73a8c62df" width="300">

- Instantiate Data Memory to CPU

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/b4a3dd8a-18e9-4d86-9caa-08c9c11c4eb1" width="300">

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/541adf63-0e1e-4fc2-91f5-f782d01d8add" width="300">

- Add stores and loads to Test program

```
// External to function:
   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
   // Function:
   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
   // Loop:
   m4_asm(ADD, r14, r13, r14)           // Incremental addition
   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
   m4_asm(SW, r0, r10, 10000)           // Store the final result value to byte address 16
   m4_asm(LW, r17, r0, 10000)           // Load the final result value from adress 16 to x17
```

- Jump Instructions

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/b4a3dd8a-18e9-4d86-9caa-08c9c11c4eb1" width="300">

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/541adf63-0e1e-4fc2-91f5-f782d01d8add" width="300">


### Final RISC-V CPU Core Implementation

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/raw/assets/79470436/21823e8d-985e-4961-871d-80ccda450b4b" width="300">

You can compare the code for a RISC-V Core implemented in both TL-Verilog and SystemVerilog by utilizing the "Show Verilog" feature in the Makerchip platform under the 'E' tab. When you visualize the code, you'll notice a substantial decrease in code size on the comparison chart.

<img src="https://github.com/Shashanksharma280201/Shashank-Sharma_RISCV/assets/79470436/d553f7d1-46bb-40aa-bfef-87987955db15" width="400">
















</details>


## Steps to install openlane2
Follow the steps on my repository [openlane_2_installation](https://github.com/Shashanksharma280201/openlane_2_installation)
