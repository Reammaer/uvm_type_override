

class base_test extends uvm_test;
    `uvm_component_utils(base_test)

    // Interface handle
    virtual dut_if  vif;

    // Sequence handle
    base_sequence base_sequence_h;

    // Environment handle
    environment     env_h;

    extern function      new            (string name = "base_test", uvm_component parent = null);
    extern function void build_phase    (uvm_phase phase);
    extern task          run_phase      (uvm_phase phase);

endclass: base_test


function base_test::new(string name = "base_test", uvm_component parent = null);
    super.new(name, parent);
endfunction: new


function void base_test::build_phase(uvm_phase phase);
    // Get handle to the singleton factory instance
    uvm_factory factory = uvm_factory::get();

    super.build_phase(phase);

    // Set factory to override "driver" by "child_driver" by type
    set_type_override_by_type(driver::get_type(), child_driver::get_type());

    // Set factory to override "driver" by "child_driver" by name
    // factory.set_type_override_by_name("driver", "child_driver");

    // Create a new environment
    env_h = environment::type_id::create("env_h", this);
    // Get interface from the tb
    if (!uvm_config_db#(virtual dut_if)::get(this, "", "dut_if", vif)) begin
        `uvm_fatal("Base test", "Interface is not connected to the test!")
    end
    // Connect interface to other uvm components
    uvm_config_db#(virtual dut_if)::set(this, "*", "dut_if", vif);
    // Create a new sequence library
    base_sequence_h = base_sequence::type_id::create("base_sequence_h");  

    // Print factory configuration
    factory.print();

endfunction: build_phase

task base_test::run_phase(uvm_phase phase);
    super.main_phase(phase);
    // Starting transaction
    phase.raise_objection(this);
    // Run transactions      
    base_sequence_h.start(env_h.agent_h.uvm_sequencer_h);
    // Finishing transactions
    phase.drop_objection(this);
endtask: run_phase