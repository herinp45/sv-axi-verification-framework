module compile_smoke;
    logic clk = 0;
    logic rst_n = 0;
    axi_lite_if axi_if(.ACLK(clk), .ARESETn(rst_n));

    always #5 clk = ~clk;
    initial begin
        axi_pkg::axi_lite_transaction trans = new();
        if (trans.randomize()) begin
            trans.display();
        end
        else begin
            $fatal("Failed to randomize AXI transaction");
        end
        rst_n = 1;
        #10;
        $finish;
        
    end
endmodule