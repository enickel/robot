*** Settings ***
#Library    Process
Library    SSHLibrary
#Library    Collections  

Suite Setup            Open Connection And Log In
Suite Teardown         Close All Connections

*** Variables ***
${HOST}                10.200.38.123
${USERNAME}            user
${PASSWORD}            password

*** Test Cases ***

Verify distro version - ok
    [Documentation]    Execute Command can be used to ran commands on the remote machine.
    ...                The keyword returns the standard output by default.
    Write              display version
    Write              \n
    ${output}=         Read Until Prompt
    Should Contain     ${output}        MA5800V100R019C22


*** Keywords ***
Open Connection And Log In
   Open Connection     ${HOST}            
   Login               ${USERNAME}        ${PASSWORD}
   Write               en
   Set Client Configuration               prompt=#
