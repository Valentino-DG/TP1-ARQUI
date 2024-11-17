# Arquitectura de Computadoras - Trabajo Práctico N.1

Alumnos:
- Ulla, Juan Ignacio.
- Di Giannantonio, Marco Valentino.

## 1. Enunciado

El trabajo consiste en realizar una ALU (Unidad Aritmética Lógica) en el lenguaje Verilog utilizando la IDE Vivado para una FPGA Basys 3.

Se debe poder ingresar dos valores y operar sobre los mismos eligiendo cualquiera de las siguientes operaciones lógicas:
- SRL
- SRA
- ADD 
- SUBU
- AND 
- OR 
- XOR
- NOR

## 2. Desarrollo

El proyecto funciona de la siguiente manera:

1. **Ingresar operando A**: Utilizando los interruptores 0-7 se carga el valor del operando A y se confirma su carga en su respectivo registro presionando el **botón izquierdo** del panel central de la placa.
2. **Ingresar operando B**: Utilizando los interruptores 0-7 se carga el valor del operando B y se confirma su carga en su respectivo registro presionando el **botón derecho** del panel central de la placa.
3. **Ingresar operación lógica a realizar**: Utilizando los interruptores 0-5 se carga el valor correspondiente a la operación a realizar y se confirma su carga en su respectivo registro presionando el **botón superior** del panel central de la placa.
4. El resultado es mostrado en los LEDs 0-7 de la placa.
5. **(opcional)**: Con el botón central del panel se ejecuta un **reset**, seteando los tres registros anteriormente mencionados en 0. 

El proyecto se dividió en tres módulos:
- ALU
- TOP
- Latch

## 3. Módulos

### 3.1 ALU
La ALU es capaz de realizar diversas operaciones aritméticas y lógicas sobre dos operandos de entrada de 8 bits (i_A e i_B), basadas en el código de operación (i_opcode). Las operaciones implementadas incluyen:

- SRL (Shift lógico a la derecha) de i_B por i_A.
- SRA (Shift aritmético a la derecha) de i_B conservando el signo.
- ADD (Suma aritmética) de i_A e i_B.
- SUBU (Resta aritmética) de i_A e i_B.
- AND, OR, XOR, NOR entre los operandos.
El resultado de la operación es almacenado en reg_resultado y enviado a la salida o_output.

Este módulo opera en base al reloj (i_clk), procesando las operaciones en cada flanco positivo.

### 3.2 Latch

Es responsable de capturar y almacenar los operandos (i_opA, i_opB) y el código de operación (i_opcode) a través de los interruptores y botones de entrada de la placa. Los botones de control (i_btn1, i_btn2, i_btn3, i_btn4) determinan cuándo se cargan los valores de los interruptores en los registros correspondientes:

- i_btn1: Carga los interruptores en el operando A.
- i_btn2: Carga los interruptores en el operando B.
- i_btn3: Carga los interruptores en el código de operación.
- i_btn4: Resetea los registros (pone todos los valores en 0).

### 3.3 TOP

El módulo principal que integra la funcionalidad de los módulos Latch y ALU. Define las conexiones entre estos componentes:

Los botones y los interruptores de la FPGA son utilizados para capturar los operandos y el código de operación, que son luego enviados a la ALU para realizar las operaciones aritméticas o lógicas.
La salida de la ALU se muestra como el resultado final de las operaciones en o_alu_output.

## 4. Conclusión

En este proyecto, se implementó una arquitectura funcional en Verilog utilizando una FPGA Basys 3, que integra un módulo ALU parametrizable y un módulo Latch para gestionar operandos y códigos de operación mediante interruptores y botones físicos. Esta combinación permite realizar operaciones aritméticas y lógicas básicas, tales como suma, resta, y operaciones de desplazamiento y bit a bit, en función de las entradas proporcionadas.

La correcta integración entre los módulos y su control mediante botones garantiza que el usuario pueda seleccionar, almacenar y procesar datos de manera eficiente, demostrando el uso práctico de una ALU dentro de un sistema reconfigurable en hardware. El proyecto permite profundizar en el diseño y funcionamiento de la FPGA.
