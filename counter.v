/********counter module *******/
    module counter (
                      input                   clk    ,     
                      output                  stop
    );
    //intialize counter to zero 
    integer  counter =0;
    assign stop = (counter >=4'b1000) ;
    always @(posedge clk) begin
        if (counter != 4'b1000) begin
           counter <= counter + 4'b0001 ; 
        end 
    end
    
    endmodule