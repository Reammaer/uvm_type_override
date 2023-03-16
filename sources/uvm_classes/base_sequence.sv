

class base_sequence extends uvm_sequence#(base_transaction);
    `uvm_object_utils(base_sequence)

    // Transaction handle
    base_transaction base_transaction_h;

    // Sequence length
    int s_length = 5;

    extern function new     (string name = "base_sequence");
    extern task     body    ();

endclass: base_sequence


function base_sequence::new(string name = "base_sequence");
    super.new(name);
endfunction


task base_sequence::body();
    repeat(s_length) begin
        // Create a new transaction
        base_transaction_h = base_transaction::type_id::create("base_transaction_h");
        // Start transaction
        start_item(base_transaction_h);
        // Ranomize transaction
        assert(base_transaction_h.randomize());
        // Finish transaction
        finish_item(base_transaction_h);
    end
endtask: body