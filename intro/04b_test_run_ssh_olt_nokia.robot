*** Settings ***
#Library    Process
Library    SSHLibrary
#Library    Collections  

Suite Setup            Open Connection And Log In
Suite Teardown         Close All Connections

*** Variables ***
${HOST}                10.200.38.115
${USERNAME}            user
${PASSWORD}            password

*** Test Cases ***
Check version
    [Documentation]    Execute Command can be used to ran commands on the remote machine.
    ...                The keyword returns the standard output by default.
    Write              show software-mngt oswp xml | match exact:swmOswpName
    ${output}=         Read Until Prompt
    Should Contain     ${output}        L6GPAA62.646

List cards
    [Documentation]    Execute Command can be used to ran commands on the remote machine.
    ...                The keyword returns the standard output by default.
    Write              show equipment slot
    ${output}=         Read Until Prompt
    Should Contain     ${output}        fglc-



*** Keywords ***
Open Connection And Log In
   Open Connection     ${HOST}            prompt=#
   Login               ${USERNAME}        ${PASSWORD}

