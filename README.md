# Laboratorio 1: ALU 4 bits
Organización del Computador 2025 - FAMAF

## Objetivos
- Comprender el funcionamiento de una Unidad Aritmética-Lógica (ALU) elemental.
- Integrar diferentes módulos lógicos y aritméticos de forma estructural.
- Comprender el concepto de diseño jerárquico en sistemas digitales.
- Utilizar el entorno de desarrollo de AMD Vivado para la creación, simulación y síntesis de diseños digitales.
- Verificar la funcionalidad de los módulos implementados mediante simulación.
- Implementar el diseño en una plataforma basada en FPGA (AMD Boolean Board).  

## Arquitectura de la ALU de 4 Bits  

**Entradas de Operandos (Input A y B - 4 bits):** La ALU recibe dos operandos de
entrada, A y B, ambos representados como números binarios de 4 bits. Estos operandos son los datos sobre los cuales la ALU realiza las operaciones.  
**Salida de Resultado (Out - 4 bits):** La ALU produce un único resultado de 4 bits en
su salida. Este valor representa el resultado de la operación aritmética o lógica
realizada sobre los operandos A y B.  
**Entrada de Control (AluOp - 3 bits):** La ALU no realiza una única operación, sino
que es capaz de ejecutar diversas funciones dependiendo de una señal de control.
En nuestra ALU, esta señal de control se denomina AluOp y está compuesta por 3
bits. Estos 3 bits permiten seleccionar hasta 8 operaciones diferentes (2³ = 8) que la
ALU podrá realizar.  
En este laboratorio, desarrollaremos una ALU capaz de realizar
las siguientes operaciones:
- AND Lógico bit a bit entre dos números binarios de 4 bits.
- OR Lógico bit a bit entre dos números binarios de 4 bits.
- Suma aritmética de dos números binarios de 4 bits.
- Resta aritmética de dos números binarios de 4 bits.
- Pass input b del número binario de 4 bits (Out = Input B).  

**Banderas de Salida (flags):** Además del resultado principal, la ALU también genera
una serie de señales de salida conocidas como flags o banderas de estado. Estas
banderas proporcionan información adicional sobre el resultado de la operación.  
Nuestra ALU deberá generar las siguientes banderas:
- Cero (Z): Esta bandera se activa (por alto a '1') si el resultado de la
operación (la salida Out) es igual a cero (en binario: 0000), caso
contrario, la bandera vale '0'.
- Carry Out (C): Esta bandera se activa cuando una operación
aritmética (como la suma) genera un acarreo fuera del bit más
significativo. Por ejemplo, al sumar dos números de 4 bits, si el
resultado excede los 4 bits, se genera un carry out.  

El desarrollo de esta ALU se realizará siguiendo un enfoque de diseño jerárquico. Esto
significa que la ALU estará compuesta por módulos internos de menor jerarquía, cada uno
encargado de realizar una función específica más básica que la anterior. Este enfoque
facilitará su implementación mediante lenguajes de descripción de hardware.

## Tareas a realizar
### ACTIVIDAD #1: Implementación de un sumador completo de 1 bit

- Diseñar el circuito sumador completo de un bit a partir del uso EXCLUSIVO de compuertas básicas (OR, AND, XOR, etc.).  
Para esto utilizar los recursos de diseño
aprendidos de circuitos combinacionales: (tabla de verdad, diagrama de Karnaugth, función simplificada y su implementación con compuertas básicas).  
También puede abordarse como la combinación de dos semisumadores y compuertas lógicas.  

- Editar el archivo adder_1bit.sv de la carpeta src para describir estructuralmente el circuito obtenido en el punto anterior.  
Para esto, instanciar la cantidad de módulos necesarios de compuertas lógicas contenidas en basic_gates.sv y las señales de conexión internas (Ejemplo: logic nombre_cable;)

### ACTIVIDAD #2: Implementación de la ALU sin resta

- Revisar el diseño de la ALU propuesto y completar el diseño estructural para la totalidad de las señales.  
Se debe utilizar solo los recursos disponibles: compuertas básicas de dos entradas (OR, AND, XOR, NOT, etc.) y el bloque de sumador completo de un bit.  
Prestar especial atención a la señal de control AluOp que determinará qué operación realizará la ALU:  
**000**: AND  
**001**: OR  
**010**: suma  
**110**: reservado resta  
**111**: pass input b  
Como en este caso la operación “resta” está excluida del diseño, las señale reservadas para esta operación deben ir conectadas a ‘0’.

 - Editar el archivo alu.sv de la carpeta src para describir estructuralmente el circuito obtenido en el punto A. Para esto, instanciar la cantidad de módulos necesarios de compuertas lógicas, multiplexores y sumadores.  
 Recordar definir además todas las señales de conexión internas.
 
 ### ACTIVIDAD #3: Modificación de la ALU para implementar la operación de resta

- Proponer un diseño a incluir en la ALU de la actividad anterior, para permitir que la misma sea capaz de realizar la operación de resta.  
Una vez diagramada la solución a implementar, realizar el diseño estructural para la totalidad de las señales y su incorporación al resto del circuito de la ALU.  
Se debe utilizar solo los recursos disponibles: compuertas básicas de dos entradas (OR, AND, XOR, NOT etc.) y el bloque de sumador completo de un bit.  
Prestar especial atención a las señales que se reservaron en el diseño de la actividad anterior para la
resta.
- Editar el archivo alu.sv de la carpeta src para describir estructuralmente el circuito obtenido en el punto anterior.  
Para esto, instanciar la cantidad de módulos necesarios de compuertas lógicas, multiplexores y sumadores.  
Recordar definir además todas las señales de conexión internas.