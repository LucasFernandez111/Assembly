; Programa que permite identificar si dos cadenas de caracteres son idénticas

JMP start

palabra1:    DB "hola\"
palabra2:    DB "hola\"

iguales:     DB "SON IGUALES\"
diferentes:  DB "SON DIFERENTES\"

start:
    MOV C, palabra1
    MOV D, palabra2
    JMP comparar

comparar:
    MOV A, [D]
    MOV B, [C]
    CMP B, '\'
    JZ sonIguales
    CMP B, A
    JNE sonDiferentes
    INC C
    INC D
    JMP comparar

sonIguales:
    MOV A, iguales
    MOV D, 232
    JMP print

sonDiferentes:
    MOV A, diferentes
    MOV D, 232
    JMP print

print:
    MOV B, [A]
    CMP B, '\'
    JZ fin
    MOV [D], B
    INC A
    INC D
    JMP print

fin:
    HLT
