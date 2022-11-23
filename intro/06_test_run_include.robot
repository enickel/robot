*** Settings ***
Metadata    Executed At    ${HOST}
Documentation        Sample of tests using include features. 
...                  More descriptiom.
Default Tags         example    sample

Resource             file.resource
Variables            myvariables.py
#Library    Process
Library    SSHLibrary
#Library    Collections  

Suite Setup            Open Connection And Log In
Suite Teardown         Close All Connections

*** Variables ***

${STRING}          This is a long string. It has multiple sentences. It does not have newlines.
${MULTILINE}       This is a long multiline string.\nThis is the second line.\nThis is the third and the last line.
@{LIST}            this     list     is    quite    long     and    items in it can also be long
&{DICT}            first=This value is pretty long.    second=This value is even longer. It has two sentences.

${STRING}          This is a long string.
...                It has multiple sentences.
...                It does not have newlines.
${MULTILINE}       SEPARATOR=\n
...                This is a long multiline string.
...                This is the second line.
...                This is the third and the last line.
@{LIST}            this     list     is      quite    long     and
...                items in it can also be long
&{DICT}            first=This value is pretty long.
...                second=This value is even longer. It has two sentences.

${HOST}                177.99.221.142
${USERNAME}            g0032120
${PASSWORD}            cenr04

*** Test Cases ***
Execute Command And Verify Output
    [tags]             diagnostics    local    subscriber
    [Documentation]    Execute Command can be used to ran commands on the remote machine.
    ...                The keyword returns the standard output by default.
    ...                Executed at ${HOST} by ${USER} . 
    Fail               Other custom message. 
    [Setup]    ${SETUP}
    Do Something
    [Teardown]    ${TEARDOWN}
    ${output}=         Execute Command  echo Hello SSHLibrary!
    Should Be Equal    ${output}        Hello SSHLibrary!     *HTML* Custom <b>ERROR</b> message.


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
Open Connection And Log In
   Open Connection     ${HOST}
   Login               ${USERNAME}        ${PASSWORD}



*** Test Cases *** 
Ping Google sem perdas
    ${result} =     Run Process	ping 	8.8.8.8	 -c	 3
    Log    ${result.stdout}
    should contain	${result.stdout} 	3 received
