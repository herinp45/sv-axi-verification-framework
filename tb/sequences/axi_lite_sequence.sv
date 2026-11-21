class axi_lite_sequence;

    // Number of transactions to generate
    int unsigned num_transactions;

    // Constructor
    function new(int unsigned count = 10);
        num_transactions = count;
    endfunction

    // Generate transactions
    task body(axi_lite_pkg::axi_lite_sequencer sequencer);
        axi_lite_pkg::axi_lite_transaction tr;

        repeat (num_transactions) begin
            // Create a new transaction
            tr = new();

            // Randomize its fields
            if (!tr.randomize()) begin
                $error("Transaction randomization failed!");
            end
            sequencer.put(tr);
            // Display generated transaction
            tr.display();
        end
    endtask
endclass
