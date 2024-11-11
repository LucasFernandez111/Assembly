; Realizar un programa que divida los valores de un vector de 6 posiciones
        JMP start

vector: DB  120
        DB  2 
        DB  3
        DB  5 
        DB  2
        DB  2 
        DB '/'   

start:
        MOV C, vector  
        MOV A, [C]
        INC C          

loop: 
        MOV B, [C]     
        CMP B, '/'     
        JZ fin         

        DIV B          
        INC C          
        JMP loop       

fin:    
        ADD A,'0'
        MOV [232], A   
        HLT            
