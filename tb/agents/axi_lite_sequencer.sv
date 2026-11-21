class axi_lite_sequencer;
    axi_lite_package::axi_lite_transaction transactions[$];

    function void put(axi_lite_package::axi_lite_transaction t);
        transactions.push_back(t);
    endfunction

    function bit try_get(axi_lite_package::axi_lite_transaction t);
        if (transactions.size() > 0) begin
            t = transactions.pop_front();
            return 1;
        end else begin
            return 0;
        end
    endfunction

    function int unsigned pending_count();
        return transactions.size();
    endfunction
endclass