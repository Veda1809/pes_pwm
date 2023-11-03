# PULSE WIDTH MODULATION (PWM) GENERATOR
## Introduction 
 In power electronics, pulse width modulation is a proven effective technique that is used to control semiconductor devices. Pulse width modulation or PWM is a commonly used control technique that generates analog signals from digital devices such as microcontrollers. The signal thus produced will have a train of pulses, and these pulses will be in the form of square waves. Thus, at any given time, the wave will either be high or low.
 
  Pulse width modulation reduces the average power delivered by an electrical signal by converting the signal into discrete parts. In the PWM technique, the signal’s energy is distributed through a series of pulses rather than a continuously varying (analog) signal.

## How is a PWM Signal Generated?
+ A pulse width modulating signal is generated using a comparator. The modulating signal forms one part of the input to the comparator, while the non-sinusoidal wave or sawtooth wave forms the other part of the input. The comparator compares two signals and generates a PWM signal as its output waveform.
   
+ If the sawtooth signal is more than the modulating signal, then the output signal is in a “High” state. The value of the magnitude determines the comparator output which defines the width of the pulse generated at the output.

<p align="center">
<img width="497" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/392b9d15-4708-4608-a780-3d552ad8f41c">
</p>

## Duty Cycle of PWM
+ As we know, a PWM signal stays **ON** for a given time and stays **OFF** for a certain time. The percentage of time for which the signal remains **ON** is known as the duty cycle. If the signal is always **ON**,  then the signal must have a 100 % duty cycle. The formula to calculate the duty cycle is given as follows:

<p align="center">
<img width="245" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/51885dab-c5a3-42d9-9eca-5e0edacd9a76">
</p>

+ The average value of the voltage depends on the duty cycle. As a result, the average value can be varied by controlling the width of the **ON** of a pulse.

## Frequency of PWM

<p align="center">
<img width="444" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/41eb8f1e-599f-4df5-be9e-81064587db6e">
</p>

+ This PWM generator generates 10Mhz signal. We can control duty cycles in steps of 10%. The default duty cycle is 50%. Along with clock signal we provide another two external signals to increase and decrease the duty cycle.

<p align="center">
<img width="500" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/2907a4a6-ee83-41e9-a97f-c1f534377548">
</p>

+ The key components we need for this particular circuit are an n-bit counter and comparator. The duty passed to the comparator is compared to the counter's current value. If the counter's current value is less than the required value, the comparator produces a high output. Similar to this, if the counter's current value is higher than its duty, the comparator's output will be low. Since the counter starts at zero, the comparator initially produces a large output, which decreases as the counter approaches its duty. Therefore, we can manage duty cycle by managing duty.

+ Since the counter is sequential and the comparator is a combinational circuit, there may be an intermediate state like 111 that is higher or lower than duty when counting from 011 to 100 as a result of inappropriate delays. A glitch might result from this. The output of the comparator is routed through a D flipflop in order to prevent these errors.

## Advantages
+ It prevents overheating of LED while maintaining its brightness.
+ It is accurate and has a fast response time.
+ It provides a high input power factor.
+ It helps motors generate maximum torque even when they run at lower speeds.

## Disadvantages
+ As the PWM frequency is high, switching losses are considerably high.
+ It induces Radio Frequency Interference (RFI).

## Applications
+ Used in telecommunication for encoding purposes.
+ Helps in voltage regulation and therefore is used to control the speed of motors.
+ Controls the fan inside a CPU of the computer, thereby successfully dissipating the heat.
+ Used in Audio/Video Amplifiers.

## Installation
For installation and more details regarding iverilog, yosys and gtkwave, refer to :

https://github.com/Veda1809/pes_asic_class

## Simulation

+ `iverilog pes_pwm.v pes_pwm_tb.v`
+ `./a.out`
+ `gtkwave pwm.vcd`

<p align="center">
<img width="565" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/9d9d530c-32c1-46ba-94c1-7b8e2fc16c6c">
</p>

<p align="center">
<img width="821" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/1627597d-0566-4117-adcd-8d435cfcdbf5">
</p>

## Synthesis
+ Invoke `yosys`
+ `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
+ `read_verilog pes_pwm.v`
+ `synth -top pes_pwm`
+ `dfflibmap -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib `
+ `abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
+ `flatten`
+ `write_verilog pes_pwm_netlist.v`
+ `show pes_pwm`

<p align="center">
<img width="221" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/c5cbd0d8-94ae-46a5-9ce7-862992e094af">
<img width="239" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/ee13bf23-3480-4856-a448-23b9fe31dfc3">
<img width="235" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/69f6f755-cc1f-446a-9bbe-180db257d62f">
</p>

<p align="center">
<img width="925" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/542fde0b-1171-44b7-9494-d929b734627d">
</p>

## Gate-Level Simulation

+ `iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v pes_pwm_netlist.v pes_pwm_tb.v`
+ `./a.out`
+ `gtkwave pwm.vcd`

<p align="center">
<img width="896" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/5356514d-0349-4a2b-9c07-427b0a82be9c">
<img width="727" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/333d2a2c-dd70-45f7-a29e-7723e8649bfc">
</p>

We can observe that output of functional simulation is matching with the output of gate level simulation, this means that the netlist generated by yosys is correct.

# Physical Design
Physical design is process of transforming netlist into layout which is manufacture-able [GDS]. Physical design process is often referred as PnR (Place and Route). Main steps in physical design are placement of all logical cells, clock tree synthesis & routing. During this process of physical design timing, power, design & technology constraints have to be met. Further design might require being optimized w.r.t power, performance and area.

## OpenLane
OpenLANE is an opensource tool or flow used for opensource tape-outs. The OpenLANE flow comprises a variety of tools such as Yosys, ABC, OpenSTA, Fault, OpenROAD app, Netgen and Magic which are used to harden chips and macros, i.e. generate final GDSII from the design RTL. The primary goal of OpenLANE is to produce clean GDSII with no human intervention. OpenLANE has been tuned to function for the Google-Skywater130 Opensource Process Design Kit.

## Installation
https://openlane.readthedocs.io/en/latest/

# Generating Layout
## Interactive Mode
+ Navigate to the openlane folder and run the following commands:
```
$ cd designs
$ mkdir pes_pwm
$ cd pes_pwm
$ mkdir src
$ vim config.tcl
$ cd src
$ vim pes_pwm.v
```
+ Include `sky130_fd_sc_hd__fast.lib`, `sky130_fd_sc_hd__slow.lib`, `sky130_fd_sc_hd__typical.lib` into the `src` folder.
+ The contents of `src` folder is shown below:
<p align="center">
<img width="515" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/60b9ab54-4d94-4a76-9cc3-56a1fa733c48">
</p>

+ The contents of `config.tcl` is shown below:
<p align="center">
<img width="574" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/e99f56d6-9fa7-491d-8188-efc270f57cbd">
</p>

+ Navigate to the openlane folder in terminal:
```
$ make mount
$ ./flow.tcl -interactive
```
+ In the tcl console:
```
% package require openlane 0.9
% prep -design pes_pwm
```
## Synthesis
```
% run_synthesis
```
+ Synthesis results
<p align="center">
<img width="362" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/fc21fa3a-ce5a-44cd-a19b-ef038936d163">
</p>

+ Flop ratio:
`Flop ratio = Number of D Flip flops / Total number of cells`
+ Flop ratio for my design is 0.3125

## Floorplan
In the VLSI physical design, floorplanning is an essential design step, as it determines the size, shape, and locations of modules in a chip and as such it estimates the total chip area, the interconnects, and, delay.
```
% run_floorplan
```
+ Floorplan results
<p align="center">
<img width="571" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/1f1e5665-5dba-4235-aea1-ee3ebb956a6d">
</p>
<p align="center">
 Core Area
</p>

<p align="center">
<img width="574" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/b85b225f-5297-4303-beea-b0176f485767">
</p>
<p align="center">
Die Area
</p>

+ Post the floorplan run, a .def file will have been created within the results/floorplan directory.
+ Navigate to that directory and open in terminal and type:
```
magic -T /home/veda/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech read lef ../../tmp/merged.lef def read pes_pwm.floorplan.def &
```
+ *Floorplan View*
<p align="center">
<img width="700" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/6ef90d38-8944-4795-a5aa-efb0135ffea4">
</p>

## Placement
Placement is the process of placing the standard cells inside the core boundary in an optimal location.
```
% run_placement
```
+ Post the placement run, a .def file will have been created within the results/placement directory.
+ Navigate to that directory and open in terminal and type:
```
magic -T /home/veda/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech read lef ../../tmp/merged.lef def read pes_pwm.placement.def &
```
+ *Placement View*
<p align="center">
<img width="674" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/a88e3897-d5a5-4c93-9acc-cdbe0d0fd802">
</p>

## Clock Tree Synthesis
Clock Tree Synthesis is a technique for distributing the clock equally among all sequential parts of a VLSI design. The purpose of Clock Tree Synthesis is to reduce skew and delay. Clock Tree Synthesis is provided the placement data as well as the clock tree limitations as input.
```
% run_cts
```
## Routing
Implements the interconnect system between standard cells using the remaining available metal layers after CTS and PDN generation. The routing is performed on routing grids to ensure minimal DRC errors.
```
% run_routing
```
+ Post the routing run, a .def file will have been created within the results/routing directory.
+ Navigate to that directory and open in terminal and type:
```
magic -T /home/veda/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech read lef ../../tmp/merged.lef def read pes_pwm.def &
```
<p align="center">
<img width="719" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/3c8fb453-df33-4395-bfe7-bd9d279eeb70">
</p>

+ Area Report
<p align="center">
<img width="803" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/be695365-bcce-4780-9ee1-a6eaca8ac48f">
</p>

## Non-Interactive Mode
+ Here we are generating the layout in the non-interactive mode or the automatic mode. In this we cant interact with the flow in the middle of each stage of the flow.The flow completes all the stages starting from synthesis until you obtain the final layout and the reports of various stages which specify the violations and problems if present during the flow.
+ Navigate to the openlane folder:
```
$ make mount
$ ./flow.tcl -design pes_pwm -tag RUN
```
+ All the steps will be automated and all the files will be generated.
+ After running all the steps, the flow complete message will appear as shown below:
<p align="center">
<img width="555" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/e7b53776-6a94-4b3f-ae92-524325481f56">
</p>

*Layout View*
<p align="center">
 <img width="823" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/737912ff-f085-426e-a5b6-eb413c71e928">
</p>

# Post Layout Results
## Gate Count
<p align="center">
<img width="908" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/96fef336-9c43-45fc-bba1-fca1b0b76fe2">
</p>

+ Number of cells = 128

## Area
<p align="center">
<img width="899" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/4c37f8da-5151-404f-8371-b295671d7dd5">
</p>

+ Area = 4723.994 um^2

## Performance
<p align="center">
 <img width="527" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/ae72a0fb-8a7f-4a52-b2dd-f2afc02a5137">
</p>

+ Performance = 1/(clock period-slack) = 1/(10-1.13)ps = 112.74GHz

## Power Performance
<p align="center">
 <img width="527" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/e79e9925-a4f7-4016-b27e-17212cfe5865">
</p>

+ Total power = 3.24e-04 Watts

## Flop/Standard Cell
<p align="center">
<img width="353" alt="image" src="https://github.com/Veda1809/pes_pwm/assets/142098395/c5981ce4-7abb-4675-9397-3c363071a8fd">
</p>

+ Flop ratio = 40/128 = 0.3125
