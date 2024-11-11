;Realizar un programa que multiplique los valores de un vector de 6
;posiciones   
     JMP start

vector: DB  2
        DB  2 
        DB  1
        DB  1 
        DB  1
        DB  1 
        DB '/'   

start:
        MOV C, vector  
        MOV A, [C]
        INC C          

loop: 
        MOV B, [C]     
        CMP B, '/'     
        JZ fin         

        MUL B          
        INC C          
        JMP loop       

fin:    
        ADD A,'0'
        MOV [232], A   
        HLT            
