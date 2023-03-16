

class child_driver extends driver;
    `uvm_component_utils(child_driver)

    extern function      new        (string name = "child_driver", uvm_component parent);
    extern function void build_phase(uvm_phase phase);
    extern task          run_phase  (uvm_phase phase);

endclass: child_driver


function child_driver::new(string name = "child_driver", uvm_component parent);
    super.new(name, parent);
endfunction: new


function void child_driver::build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction: build_phase


task child_driver::run_phase(uvm_phase phase);
    // Trasnaction handle
    base_transaction base_transaction_h;

    forever begin
        @(posedge vif.clk)
            // Get a new transaction                         
            seq_item_port.get_next_item(base_transaction_h);
            vif.i_data   <= 'hFF;
            // Waiting for the new data
            seq_item_port.item_done();
    end
endtask: run_phase