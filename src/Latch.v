module Latch#(parameter DATA_SIZE = 8)(
    input i_btn1, i_btn2, i_btn3, i_btn4, // Botones
    input [DATA_SIZE-1 :0] i_sw,          // Interruptores
    input i_clk,                          // Señal de reloj
    
    output [DATA_SIZE-1 :0] o_opA,        // Registro para operandos A
    output [DATA_SIZE-1 :0] o_opB,        // Registro para operandos B
    output [DATA_SIZE-1 :0] o_opcode      // Registro para el código de operación
);

    reg [DATA_SIZE-1 :0] reg_operandoA;   // Registro para operandos A
    reg [DATA_SIZE-1 :0] reg_operandoB;   // Registro para operandos B
    reg [DATA_SIZE-1 :0] reg_opcode;      // Registro para el código de operación

    always @(posedge i_clk) begin
        if (i_btn4) begin              // Reset -> Seteamos todos los registros en 0 con prioridad sobre las otras condiciones
            reg_operandoA <= 8'b0;
            reg_operandoB <= 8'b0;
            reg_opcode <= 8'b0;
        end else begin
            if (i_btn1) begin
                reg_operandoA <= i_sw;  // Almacenamos la combinación de los interruptores en el operando A
            end
            if (i_btn2) begin
                reg_operandoB <= i_sw;  // Almacenamos la combinación de los interruptores en el operando B
            end
            if (i_btn3) begin
                reg_opcode <= i_sw;     // Almacenamos la combinación de los interruptores en el Código de Operación
            end
        end
    end

    // Output
    assign o_opA = reg_operandoA;
    assign o_opB = reg_operandoB;
    assign o_opcode = reg_opcode;

endmodule