`timescale 1ns / 1ps


// Definición del módulo ALU con puertos de entrada y salida
module ALU#(parameter DATA_SIZE = 8)(
    input [DATA_SIZE - 1 : 0] i_A,          // Entrada A de 8 bits
    input [DATA_SIZE - 1 : 0] i_B,          // Entrada B de 8 bits
    input [5 : 0] i_opcode,                 // Entrada op de 6 bits para control de operación
    input i_clk,                              // Entrada reloj 
    output [DATA_SIZE - 1 : 0] o_output     // Salida de 8 bits que contendrá el resultado
);
    localparam SRL      =   6'b101000;   // Right Shift i_B shamt (insertando ceros) L de logic
    localparam SRA      =   6'b100111;   // Right Shift i_B shamt (Aritmetico, conservando el sig)
    localparam ADD      =   6'b100000;
    localparam SUBU     =   6'b100010;   // rs - rt (signed obvio)
    localparam AND      =   6'b100100; 
    localparam OR       =   6'b100101; 
    localparam XOR      =   6'b100110; 
    localparam NOR      =   6'b101001;

    reg[DATA_SIZE : 0] reg_resultado; // Se almacena el resultado
    assign o_output = reg_resultado; //7:0
    
    always @(posedge i_clk)
    case (i_opcode)
        SRL  : reg_resultado    <= i_B  >>  i_A;
        SRA  : reg_resultado    <= $signed(i_B) >>>  i_A;
        ADD  : reg_resultado    <= $signed (i_A) + $signed (i_B);
        SUBU : reg_resultado    <= $signed (i_A) - $signed (i_B);
        AND  : reg_resultado    <=  i_A & i_B;
        OR   : reg_resultado    <=  i_A | i_B;
        XOR  : reg_resultado    <=  i_A ^ i_B;
        NOR  : reg_resultado    <= ~(i_A | i_B);
        default: reg_resultado   <= {DATA_SIZE{1'b1}};
    endcase
    
endmodule