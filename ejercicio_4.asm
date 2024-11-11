; Imprimir por pantalla "Hola, soy alumno de la U.N.O."

JMP start               ; Salta al inicio del programa

frase:       DB "Hola, soy alumno de la U.N.O."  ; Cadena de texto a imprimir
             DB '/'                             ; Indicador final de string
maxCaracter: DB 19                              ; Máx. caracteres por línea

start:
    MOV B, frase        ; Apunta a la cadena
    MOV D, 232          ; Puerto de Salida inicial
    JMP loop            ; Salta al bucle principal

loop:
    MOV A, [B]          ; Carga el carácter actual en el registro A
    CMP A, '/'          ; Compara con el indicador final de string
    JZ fin              ; Si es '/', termina el programa
    CALL print          ; Llama a la subrutina para imprimir

print:
    MOV [D], A          ; Imprime el carácter en el puerto de salida
    INC D               ; Incrementa el puntero de salida
    INC B               ; Pasa al siguiente carácter de la cadena
    INC C               ; Incrementa el contador de caracteres
    CMP C, [maxCaracter]; Compara el contador con el máx. permitido
    JZ reseetear_salidas; Si se llegó al máximo, resetea la salida
    JMP loop            ; Vuelve al bucle principal

reseetear_salidas:
    CMP D, 231          ; Compara si el puerto de salida está en el límite inferior
    JZ loop             ; Si llegó al límite, vuelve al bucle principal
    MOV [D], ' '        ; Escribe un espacio para resetear
    DEC D               ; Decrementa el puerto de salida
    DEC C               ; Decrementa el contador de caracteres
    JMP reseetear_salidas; Repite el reseteo de salidas

fin:
    HLT                 ; Finaliza el programa
