# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/gyl/Vivado/DigitalLogic/flowing_light/flowing_light.cache/wt [current_project]
set_property parent.project_path C:/Users/gyl/Vivado/DigitalLogic/flowing_light/flowing_light.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_verilog -library xil_defaultlib C:/Users/gyl/Vivado/DigitalLogic/flowing_light/flowing_light.srcs/sources_1/new/flowing_light.v
read_xdc C:/Users/gyl/Vivado/DigitalLogic/flowing_light/flowing_light.srcs/constrs_1/new/top_xdc.xdc
set_property used_in_implementation false [get_files C:/Users/gyl/Vivado/DigitalLogic/flowing_light/flowing_light.srcs/constrs_1/new/top_xdc.xdc]

synth_design -top flowing_light -part xc7a35tcsg324-1
write_checkpoint -noxdef flowing_light.dcp
catch { report_utilization -file flowing_light_utilization_synth.rpt -pb flowing_light_utilization_synth.pb }
