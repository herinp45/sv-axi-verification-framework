package axi_lite_pkg;

    typedef enum bit {
        AXI_READ,
        AXI_WRITE
    } axi_operation_t;

    class axi_lite_transaction;

        rand axi_operation_t operation;
        rand bit [31:0] addr;
        rand bit [31:0] data;
        /**
            * AXI-Lite uses a 4-bit strobe to indicate which bytes of the data bus are valid.
            * Each bit corresponds to one byte of the 32-bit data bus.
            * For example, strb = 4'b1111 means all bytes are valid, while strb = 4'b0011 means only the lower two bytes are valid.
        */
        rand bit [3:0]  strb;
        constraint aligned_address {
            addr[1:0] == 2'b00;
        }

        function new();
            addr = '0;
            data = '0;
            strb = 4'b1111;
        endfunction

        function void display();
            $display(
                "AXI transaction: op=%s addr=%08h data=%08h strb=%h",
                operation.name(), addr, data, strb
            );
        endfunction

    endclass

endpackage