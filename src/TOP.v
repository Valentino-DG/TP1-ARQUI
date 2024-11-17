module TopModule#(parameter DATA_SIZE = 8)(

    /*
        Boton del centro para reset. 
        Boton de arriba para el codigo de operacion. 
        Boton de la izquierda para el operando A. 
        Boton de la derecha para el operando B 
    */
    input wire i_boton1, i_boton2, i_boton3, i_boton4,    // Botones
    input wire [DATA_SIZE-1 : 0] i_switches,              // Interruptores
    input wire i_clk,                                     // Señal de reloj
    output wire [DATA_SIZE-1 : 0] o_alu_output            // Salida de la ALU
);
  
     wire [DATA_SIZE-1 : 0] o_operandoA;              // Registro para operandos A
     wire [DATA_SIZE-1 : 0] o_operandoB;              // Registro para operandos B
     wire [5:0] o_codigoOperacion;                    // Registro para el código de operación
  
    // Instancia el módulo de control de registros
    Latch instanciaLatch (
        .i_btn1(i_boton1),
        .i_btn2(i_boton2),
        .i_btn3(i_boton3),
        .i_btn4(i_boton4),
        .i_sw(i_switches),
        .i_clk(i_clk),
        
        // Indicamos que las salidas del Latch van a los wire del TOP
        .o_opA(o_operandoA),         
        .o_opB(o_operandoB),
        .o_opcode(o_codigoOperacion)
    );

    // Instancia el módulo de la ALU
    ALU instanciaALU (
        // Indicamos que las entradas y salida de la ALU son los wire del TOP
        .i_A(o_operandoA),
        .i_B(o_operandoB),
        .i_opcode(o_codigoOperacion),
        .i_clk(i_clk),
        .o_output(o_alu_output)
    );

endmodule