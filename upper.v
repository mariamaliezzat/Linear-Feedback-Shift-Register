    module upper (
    input  [3:0]                        seed                   ,
    input                               clk                    ,
    input                               rst                    ,
    output [3:0]                        OUT_allbits
    );
    
    wire D1;
    wire D2;
    wire D3;
    wire D4;
    wire Q1;
    wire Q2;
    wire Q3;
    wire Q4;
    wire xor_out;
    assign xor_out     = Q3 ^ Q4         ;
    assign D1          = xor_out ^ Q2    ;
    assign D2          = Q1              ;
    assign D3          = Q2              ;
    assign D4          = Q3              ;
    assign OUT_allbits = {Q1,Q2,Q3,Q4}   ;
    shift shift1 (
        .clk(clk),
        .rst(rst),
        .rst_data(seed[0]),
        .D(D1),
        .Q(Q1)

    );
    shift shift2 (
        .clk(clk),
        .rst(rst),
        .rst_data(seed[1]),
        .D(D2),
        .Q(Q2)
    );
    shift shift3(
        .clk(clk),
        .rst(rst),
        .rst_data(seed[2]),
        .D(D3),
        .Q(Q3)
    );
    shift shift4(
        .clk(clk),
        .rst(rst),
        .rst_data(seed[3]),
        .D(D4),
        .Q(Q4)
    );
    endmodule