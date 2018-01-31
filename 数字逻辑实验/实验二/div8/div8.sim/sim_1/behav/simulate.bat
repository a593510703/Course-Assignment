@echo off
set xv_path=F:\\Xilinx_vivado\\Vivado\\2015.4\\bin
call %xv_path%/xsim div84_sim_behav -key {Behavioral:sim_1:Functional:div84_sim} -tclbatch div84_sim.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
