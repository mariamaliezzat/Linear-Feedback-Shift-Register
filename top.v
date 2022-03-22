/******top module ***********/
    module top (
    input                                                rst     ,
    input                                                clk     ,
    input        [3:0]                                   seed    ,
    output                      reg                      OUT     ,
    output                      reg                      vaild

    );
    //internal signals
    wire [3:0]   OUT_allbits ;
    reg  [3:0]   All_out     ;
    wire         stop        ;
    //integer for loop
    integer      i = 0       ;   
    always @(posedge stop) begin
        if (stop) begin
            vaild   <=   1'b1           ;
            All_out =   OUT_allbits     ;
        end
    end
    always @(posedge vaild ) begin
        for (i = 1'b0;i<4 ;i=i+1'b1 ) begin
       @(posedge clk) OUT <= All_out[i] ; 
   end
    end
   
  
    upper upper1(
    .clk(clk),
    .rst(rst),
    .seed(seed),
    .OUT_allbits(OUT_allbits)
    );

    counter counter1(
        .clk(clk),
        .stop(stop)
    );
    
    endmodule