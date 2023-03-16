

package uvm_class_pkg;

    `include "uvm_macros.svh"
    import uvm_pkg::*;

    `include "uvm_classes/base_transaction.sv"
    typedef uvm_sequencer #(base_transaction) sequencer;

    `include "uvm_classes/base_sequence.sv"
    `include "uvm_classes/driver.sv"
    `include "uvm_classes/child_driver.sv"
    `include "uvm_classes/agent.sv"
    `include "uvm_classes/environment.sv"
    `include "uvm_classes/base_test.sv"

endpackage: uvm_class_pkg