*** Settings ***
Library    Process   
#Library    Collections  

*** Test Cases *** 
Ping Google sem perdas
    ${result} =     Run Process	ping 	8.8.8.8	 -c	 3
    Log    ${result.stdout}
    should contain	${result.stdout} 	3 received
