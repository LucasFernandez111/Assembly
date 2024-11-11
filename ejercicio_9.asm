; Realizar un programa que multiplique las 2 primeras posiciones del
; vector, las sume con las 2 siguientes y la
; reste con la última. (vector de 5 posiciones)

        JMP start

vector: DB 4
        DB 5
        DB 4
        DB 1
        DB 7
        DB '/'

start:
        MOV C, vector
        MOV A, [vector] ; Mueve el primer número a A
        JMP calcular

calcular:
        INC C
        INC B ; CONTADOR de vector
        MOV D, [C]
        CMP D, '/'
        JZ fin
        CMP B, 1
        JBE multi
        CMP B, 4
        JZ restar
        JMP sumar

sumar:
        ADD A, D
        JMP calcular

multi:
        MUL D
        JMP calcular

restar:
        SUB A, D
        JMP calcular

fin:
        HLT