/*******shift module *******/
    module shift (
    input                                    clk         ,
    input                                    D           ,
    input                                    rst         ,
    input                                    rst_data    ,
    output       reg                         Q
    );
    always @(posedge clk , negedge rst) begin
        if (!rst) begin
            Q <= rst_data ;
        end else begin
            Q <= D ; 
        end
       
    end
    endmodule