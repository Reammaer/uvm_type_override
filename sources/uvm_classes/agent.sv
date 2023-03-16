

class agent extends uvm_agent;
    `uvm_component_utils(agent)

    // Driver handle
    driver  driver_h;

    // uvm_sequencer handle
    sequencer uvm_sequencer_h; 

    extern function      new            (string name, uvm_component parent);
    extern function void build_phase    (uvm_phase phase);
    extern function void connect_phase  (uvm_phase phase); 

endclass: agent

function agent::new(string name, uvm_component parent);
    super.new(name, parent);
endfunction: new

function void agent::build_phase(uvm_phase phase);
    super.build_phase(phase);  
    // Create a new driver
    driver_h = driver::type_id::create("driver_h", this);
    // Create a new uvm_sequencer
    uvm_sequencer_h = sequencer::type_id::create("uvm_sequencer", this);
    
endfunction: build_phase

function void agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    // Connect driver with sequencer
    driver_h.seq_item_port.connect(uvm_sequencer_h.seq_item_export);

endfunction: connect_phase