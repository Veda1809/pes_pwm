
# Design
set ::env(DESIGN_NAME) "pes_pwm"

set ::env(VERILOG_FILES) "./designs/pes_pwm/src/pes_pwm.v"


set ::env(CLOCK_PERIOD) "10.000"
set ::env(CLOCK_PORT) "clk"


set ::env(CLOCK_NET) $::env(CLOCK_PORT)
set ::env(FP_CORE_UTIL) 50
set ::env(FP_IO_VMETAL) 4
set ::env(FP_IO_HMETAL) 3

set ::env(LIB_SYNTH) [glob $::env(OPENLANE_ROOT)/designs/$::env(DESIGN_NAME)/src/sky130_fd_sc_hd__typical.lib]
set ::env(LIB_FASTEST) [glob $::env(OPENLANE_ROOT)/designs/$::env(DESIGN_NAME)/src/sky130_fd_sc_hd__fast.lib]
set ::env(LIB_SLOWEST) [glob $::env(OPENLANE_ROOT)/designs/$::env(DESIGN_NAME)/src/sky130_fd_sc_hd__slow.lib]
set ::env(LIB_TYPICAL) [glob $::env(OPENLANE_ROOT)/designs/$::env(DESIGN_NAME)/src/sky130_fd_sc_hd__typical.lib]

set filename $::env(OPENLANE_ROOT)/designs/$::env(DESIGN_NAME)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}
