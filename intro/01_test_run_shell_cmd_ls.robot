*** Settings ***
Library    Process     

*** Test Cases *** 
Exibe os arquivos
    ${result} =     Run Process     ls 
    Log    ${result.stdout}
    
Pinga o google
    ${result} =     Run Process	   ping 	8.8.8.8	 -c	 3
    Log    ${result.stdout}

