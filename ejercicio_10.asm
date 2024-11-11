;Realizar un programa que dado un vector de 5 posiciones multiplique ;la primera posición con la segunda, la
;sume con la tercera, divida con la cuarta y reste con la quinta

	JMP start
vector: DB 2
        DB 5
        DB 4
        DB 1
        DB 7
        DB '/'

start:
      MOV C,vector
      MOV A,[vector];Mueve el primer numero a A
      JMP calcular


calcular: 
      INC C  
      INC B ; CONTADOR de vector
      MOV D,[C]
      CMP D,'/'
      JZ fin 
      CMP B,1
      JZ multi
      CMP B,2
      JZ sumar
      CMP B,3
      JZ dividir
      JMP restar
  
sumar:
    ADD A,D
    JMP calcular

multi:
      MUL D
      JMP calcular


dividir:
        DIV D 
        JMP calcular

restar: 
       SUB A,D
       JMP calcular

fin: HLT