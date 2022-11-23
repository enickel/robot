*** Settings ***
#Library    Process
Library    SSHLibrary
#Library    Collections  

Suite Setup            Open Connection And Log In in the Jump Server 
Suite Setup            Open Connection And Log In
Suite Teardown         Close All Connections

*** Variables ***
${JUMP_HOST}           189.58.96.139
${JUMP_USERNAME}       user
${JUMP_PASSWORD}       password

${HOST}                189.58.97.12
${USERNAME}            user	
${PASSWORD}            password

*** Test Cases ***
Execute Command And Verify Output
    [Documentation]    Execute Command can be used to ran commands on the remote machine.
    ...                The keyword returns the standard output by default.
    Switch Connection  ne
    ${output}=         Execute Command  echo Hello SSHLibrary!
    Should Be Equal    ${output}        Hello SSHLibrary!

Verify distro version - ok
    [Documentation]    Execute Command can be used to ran commands on the remote machine.
    ...                The keyword returns the standard output by default.
    ${output}=         Execute Command  cat /etc/lsb-release
    Should Contain     ${output}        DISTRIB_RELEASE=20.04

Verify distro version - nok
    [Documentation]    Execute Command can be used to ran commands on the remote machine.
    ...                The keyword returns the standard output by default.
    ${output}=         Execute Command  cat /etc/lsb-release
    Should Contain     ${output}        DISTRIB_RELEASE=20.03

Execute Command And Verify Return Code
    [Documentation]    Often getting the return code of the command is enough.
    ...                This behaviour can be adjusted as Execute Command arguments.
    ${rc}=             Execute Command  echo Success guaranteed.    return_stdout=False    return_rc=True
    Should Be Equal    ${rc}            ${0}

Executing Commands In An Interactive Session
    [Documentation]    Execute Command always executes the command in a new shell.
    ...                This means that changes to the environment are not persisted
    ...                between subsequent Execute Command keyword calls.
    ...                Write and Read Until variants can be used to operate in the same shell.
    Write              cd ..
    Write              echo Hello from the parent directory!
    ${output}=         Read Until       directory!
    Should End With    ${output}        Hello from the parent directory!

*** Keywords ***

Open Connection And Log In in the Jump Server 
   Open Connection     ${JUMP_HOST}            alias=jump
   Login               ${JUMP_USERNAME}        ${JUMP_PASSWORD}

Open Connection And Log In
   Open Connection     ${HOST}            alias=ne
   Login               ${USERNAME}        ${PASSWORD}

