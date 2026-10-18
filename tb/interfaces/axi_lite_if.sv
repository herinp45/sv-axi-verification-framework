interface axi_lite_if (input ACLK, input ARESETn);
    // Write address channel
    logic [31:0] AWADDR;
    logic        AWVALID;
    logic        AWREADY;

    // Write data channel
    logic [31:0] WDATA;
    logic [3:0]  WSTRB;
    logic        WVALID;
    logic        WREADY;

    // Write response channel
    logic [1:0]  BRESP;
    logic        BVALID;
    logic        BREADY;

    // Read address channel
    logic [31:0] ARADDR;
    logic        ARVALID;
    logic        ARREADY;

    // Read data channel
    logic [31:0] RDATA;
    logic [1:0]  RRESP;
    logic        RVALID;
    logic        RREADY;

    modport master (
        input  ACLK,
        input  ARESETn,
        output AWADDR,
        output AWVALID,
        input  AWREADY,
        output WDATA,
        output WSTRB,
        output WVALID,
        input  WREADY,
        input  BRESP,
        input  BVALID,
        output BREADY,
        output ARADDR,
        output ARVALID,
        input  ARREADY,
        input  RDATA,
        input  RRESP,
        input  RVALID,
        output RREADY
    );

    modport slave (
        input  ACLK,
        input  ARESETn,
        input  AWADDR,
        input  AWVALID,
        output AWREADY,
        input  WDATA,
        input  WSTRB,
        input  WVALID,
        output WREADY,
        output BRESP,
        output BVALID,
        input  BREADY,
        input  ARADDR,
        input  ARVALID,
        output ARREADY,
        output RDATA,
        output RRESP,
        output RVALID,
        input  RREADY
    );
    
endinterface