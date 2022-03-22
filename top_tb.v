/*************test bench ***********/
    `timescale 1ns/1ns
    module top_tb (
    );

    reg                       clk_tb      ;
    reg                       rst_tb      ;
    reg               [3:0]   seed_tb     ;
    wire                      OUT_tb      ;
    wire                      vaild_tb    ;

    parameter CLOCK_PERIOD = 10 ;
    parameter HALF_CLOCK   = CLOCK_PERIOD / 2 ;
    initial begin
        $dumpfile("LFSR.vcd");
        $dumpvars;
        clk_tb = 0       ;
        rst_tb = 0       ;
        seed_tb = 4'b1001;
        DUT.vaild = 0    ;
        DUT.i = 0        ;
        #3
        rst_tb = 1 ;
        #4
        /******* CYCLE 1**********/
        $display ("out = %0b",DUT.OUT_allbits);
        if (DUT.OUT_allbits == 4'b1100) begin
            $display("test 1 passed");
        end else begin
            $display("test 1 failed");
        end
        /******* CYCLE 2**********/
        #CLOCK_PERIOD
        if (DUT.OUT_allbits == 4'b1110) begin
            $display("test 2 passed");
        end else begin
            $display("test 2 failed");
        end
        /******* CYCLE 3**********/
        #CLOCK_PERIOD
        if (DUT.OUT_allbits == 4'b0111) begin
            $display("test 3 passed");
        end else begin
            $display("test 3 failed");
        end
        /******* CYCLE 4**********/ 
        #CLOCK_PERIOD
        if (DUT.OUT_allbits == 4'b1011) begin
            $display("test 4 passed");
        end else begin
            $display("test 4 failed");
        end
        /******* CYCLE 5**********/
        #CLOCK_PERIOD
        if (DUT.OUT_allbits == 4'b0101) begin
            $display("test 5 passed");
        end else begin
            $display("test 5 failed");
        end
        /******* CYCLE 6**********/
        #CLOCK_PERIOD
        if (DUT.OUT_allbits == 4'b0010) begin
            $display("test 6 passed");
        end else begin
            $display("test 6 failed");
        end
        /******* CYCLE 7**********/
        #CLOCK_PERIOD
        if (DUT.OUT_allbits == 4'b1001) begin
            $display("test 7 passed");
        end else begin
            $display("test 7 failed");
        end
        /******* CYCLE 8**********/
        #CLOCK_PERIOD
        if (DUT.OUT_allbits == 4'b1100) begin
            $display("test 8 passed");
        end else begin
            $display("test 8 failed");
        end
        

        #CLOCK_PERIOD
        if (OUT_tb == 1'b0) begin
            $display("test 9 passed");
        end else begin
            $display("test 9 failed");
        end
        #CLOCK_PERIOD
         if (OUT_tb == 1'b0) begin
            $display("test 10 passed");
        end else begin
            $display("test 10 failed");
        end
        #CLOCK_PERIOD
        if (OUT_tb == 1'b1) begin
            $display("test 11 passed");
        end else begin
            $display("test 11 failed");
        end
        #CLOCK_PERIOD
        if (OUT_tb == 1'b1) begin
            $display("test 12 passed");
        end else begin
            $display("test 12 failed");
        end
        #100
        $finish;
        
        
    end

    always #HALF_CLOCK clk_tb = ~ clk_tb ;
    top DUT (
                .clk(clk_tb),
                .rst(rst_tb),
                .seed(seed_tb),
                .OUT(OUT_tb),
                .vaild(vaild_tb)
    );
    endmodule