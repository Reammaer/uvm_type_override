

class base_transaction extends uvm_sequence_item;
    `uvm_object_utils(base_transaction)

    randc logic [7:0]   idata;

    extern function new (string name = "");

endclass: base_transaction


function base_transaction::new(string name = "");
    super.new(name);
endfunction: new


