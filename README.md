# Shashank-Sharma_RISCV

## First step is to install openlane2
Follow the steps on my repository [openlane_2_installation](https://github.com/Shashanksharma280201/openlane_2_installation)



# Makerchip

Navigate to [Makerchip](https://www.makerchip.com/sandbox/)  IDE

Makerchip is a web-based platform for digital design and development. It provides tools and resources for creating and simulating digital circuits and systems, with a focus on the development of custom microprocessors and system-on-chip (SoC) designs. Makerchip offers a collaborative and integrated environment that includes a code editor, a simulator, and various libraries for hardware description and simulation.

- **SystemVerilog Support**: Makerchip allows users to write and simulate digital designs using the SystemVerilog hardware description language, making it suitable for both     beginners and experienced designers.
- **RISC-V and Custom Microprocessor Design**: It provides tools for designing custom RISC-V processors or creating entirely new microprocessor architectures.
- **Code Simulation**: Users can simulate their designs to test functionality and identify potential issues before moving on to the actual hardware implementation.
- **Collaboration**: Makerchip supports collaborative work, enabling multiple users to work on the same project simultaneously.
- **Online Platform**: As a web-based tool, Makerchip eliminates the need for users to install and maintain specialized software, making it accessible from various devices      with an internet connection.


# Week 1

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
