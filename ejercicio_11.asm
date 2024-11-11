; Programa para identificar si una cadena es palíndromo

    JMP start

string: DB "raedar"
terminator:  DB '/'

p: DB "ES PALINDROMO/"
np: DB "NO ES PALINDROMO/"

start:
    MOV C,string     
    MOV B,terminator
    SUB B,1
    MOV D, 232
    JMP comparar
    

comparar:
    MOV A, [C]
    CMP A, '/'
    JZ esPalindromo
    CMP A, [B]
    JNE noEsPalindromo
    DEC B
    INC C
    JMP comparar


noEsPalindromo:
    MOV A, np
    JMP print

esPalindromo:
    MOV A, p
    JMP print

print:
    MOV B, [A]
    CMP B, '/'
    JZ fin
    MOV [D], B
    INC D
    INC A
    JMP print

fin:
    HLT