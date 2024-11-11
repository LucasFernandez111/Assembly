; Realizar un programa que sume los valores de un vector de 5 posiciones.

JMP start

; Vector de datos con 5 posiciones y un delimitador ('/') al final
vector: 
    DB 1
    DB 2
    DB 1
    DB 2
    DB '/'


start:
    MOV C, vector      ; C apunta al inicio del vector
    MOV A, 0           ; Inicializamos el acumulador A en 0

    CALL sumar         ; Llamada a la subrutina para sumar los valores

sumar:
    MOV B, [C]         ; Carga el valor del vector en B
    CMP B, '/'         ; Compara el valor con el delimitador ('/')
    JZ print           ; Si es '/', saltamos a la impresión
    ADD A, B           ; Suma el valor de B al acumulador A
    INC C              ; Avanzamos al siguiente valor del vector
    JMP sumar          ; Repite el ciclo

print:
    MOV D, 232         ; Dirección para imprimir el resultado
    ADD A, '0'         ; Convertimos la suma a su valor ASCII
    MOV [D], A         ; Imprime el valor de A (como carácter ASCII)

    HLT                ; Detenemos el programa
