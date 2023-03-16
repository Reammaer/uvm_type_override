

class environment extends uvm_env;
    `uvm_component_utils(environment)

    // Agent handle
    agent   agent_h;

    extern function      new            (string name, uvm_component parent);
    extern function void build_phase    (uvm_phase phase);
    extern function void connect_phase  (uvm_phase phase); 

endclass: environment

function environment::new(string name, uvm_component parent);
    super.new(name, parent);
endfunction: new

function void environment::build_phase(uvm_phase phase);
    super.build_phase(phase);     
    // Create a new agent
    agent_h = agent::type_id::create("agent_h", this);  
endfunction: build_phase

function void environment::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
endfunction: connect_phase