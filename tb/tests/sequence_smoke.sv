module sequence_smoke;
    import axi_lite_pkg::*;

    axi_lite_sequencer sequencer;
    axi_lite_sequence sequence;

    intial begin
        sequencer = new();
        sequence = new(10); // Generate 10 transactions
        sequence.body(sequencer);
        $display("Total transactions generated: %0d", sequencer.pending_count());

        while (sequencer.pending_count() > 0) begin
            axi_lite_transaction tr;
            if (sequencer.try_get(tr)) begin
                tr.display();
            end
        end
        $display("All transactions processed.");
        $finish;
    end
endmodule