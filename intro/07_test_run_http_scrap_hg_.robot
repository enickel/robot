#https://robocorp.com/docs/development-guide/http/http-examples

*** Settings ***
#Library    Process
#Library           SSHLibrary
Library           Collections
Library           String
Library           RequestsLibrary
Library            XML

#Suite Setup            Open Connection And Log In
#Suite Teardown         Close All Connections

*** Variables ***
${HG_IP}                192.168.15.1
${HG_USERNAME}          user
${HG_PASSWORD}          password

*** Test Cases ***

Check hg about page ok 
    ${resp}=    GET    http://${HG_IP}/webClient/about-power-box.html
    Status Should Be    OK    ${resp}

Check hg gpon sn 
    ${resp2}=    GET     http://${HG_IP}/webClient/about-power-box.html
    #${p} = 	Get Element     ${resp} 	second
    #Should Be Equal 	${p.text} 	\n${SPACE*6}Text with${SPACE} 	
    #${gpon_sn} =     Should Match Regexp   ${resp}      <strong>NÃºmero de SÃ©rie GPON:</strong></td><td>*</td>
    #${gpon_sn} =     Get Regexp Matches       ${resp}       GPON:</strong></td><td>*</td>
    ${matches} =     Get Regexp Matches       str(${resp2})       GP(.)N:

*** Keywords ***
Open Connection And Log In
   Open Connection     ${HOST}            prompt=#
   Login               ${USERNAME}        ${PASSWORD}

