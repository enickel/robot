##  Enickel - Eduardo.nickel@telefonica.com
##  
##  IPTV open platform - quick connectivity test.
##


*** Settings ***
Documentation		Enickel IPTV Quick Check
...		\nTO DO: Grab screenshot from Open Video Channel.
...		\nTO DO: Check multicast join in control groups (e.g. OPCH, etc).
Library    Process   
#Library    Collections  

*** Variables ***

${ROBOT_IF}	eth0
${HG_IP}	192.168.x.x

${TV_GW}	10.114.10.129
${TV_DNS_PRI}	177.16.30.7
${TV_DNS_SEC}	177.16.30.67
${TV_FCC}	177.16.30.252
${TV_DATAHUB}	177.16.30.8
${TV_RTCP_COLLECTOR}	177.16.30.254
${MCAST_IP}	239.128.1.207

*** Test Cases *** 
Configure interface
#	Get for the test interface
	[ tags ]	test setup
	[ Documentation ]	Trying to obtain IP for the test machine
	log to console		Configuration of test machine

Identifica a subrede do HG
	[ tags ]		environment info
	log to console		Identificando interface local e rede do HG

#	${result} =		Run Process	ip route | grep default | grep eth0 | grep dhcp | cut -d" " -f3		shell=yes
#	${result} =		Run Process	ip route | grep default | grep eth0 | cut -d" " -f3		shell=yes
	${result} =		Run Process	ip route | grep default | cut -d" " -f5	shell=yes	
	log to console		${result.stdout}
	Log			${result.stdout}
	Set suite variable	${ROBOT_IF}	{result.stdout}

	${result} =		Run Process	ip route | grep default | cut -d" " -f3	shell=yes	
	log to console		${result.stdout}
	Log			${result.stdout}
	Set suite variable	${HG_IP}	${result.stdout}


Verificando a conectividade com o HG - ${HG_IP}
	[ tags ]	environment info
	log to console	Obtaining HG info
	
    ${result} =     Run Process	ping 	${HG_IP}	 -c	 2	-W	2
    Log    ${result.stdout}
    should contain	${result.stdout} 	2 received

#
#Verificando a subrede HG - 192.168.15.1
#	[ tags ]	environment info
#	log to console	Obtaining HG info
#	
#    ${result} =     Run Process	ping 	192.168.15.1	 -c	 2	-W	2
#    Log    ${result.stdout}
#    should contain	${result.stdout} 	2 received
        

#Verificando a subrede HG - 192.168.25.1
#	[ tags ]	environment info
#	log to console	Obtaining HG info
#	
#   ${result} =     Run Process	ping 	192.168.25.1	 -c	 2	-W	2
#   Log    ${result.stdout}
#   should contain	${result.stdout} 	2 received
    
Verificando a conexão com a internet - 8.8.8.8
	[ tags ]	ping
    ${result} =     Run Process	ping 	8.8.8.8	 -c	 2	-W	2
    Log    ${result.stdout}
    should contain	${result.stdout} 	2 received
    
Verificando a conexão com o GW de TV - ${TV_GW}
	[ tags ]	ping
    ${result} =     Run Process	ping 	${TV_GW}	 -c	 2	-W	2
    Log    ${result.stdout}
    should contain	${result.stdout} 	2 received

Ping DNS primario de tv - ${TV_DNS_PRI}
	[ tags ]	ping
    ${result} =     Run Process	ping 	${TV_DNS_PRI}	 -c	 3	-W	2
    Log    ${result.stdout}
    should contain	${result.stdout} 	3 received

Ping DNS secundario de tv - ${TV_DNS_SEC}
	[ tags ]	ping
    ${result} =     Run Process	ping 	${TV_DNS_SEC}	 -c	 3	-W	2
    Log    ${result.stdout}
    should contain	${result.stdout} 	3 received

Resolução FQDN a.ntp.br no DNS do HG
	[ tags ]	dns
    ${result} =     Run Process	nslookup	a.ntp.br	${HG_IP}	 
    Log    ${result.stdout}
    should be equal as integers	${result.rc} 	0

Resolução FQDN telefonica.com no DNS primário de tv
	[ tags ]	dns	dns primario
    ${result} =     Run Process	nslookup	telefonica.com	${TV_DNS_PRI}	 	 
    Log    ${result.stdout}
    should be equal as integers	${result.rc} 	0
 
Resolução FQDN canoway-br.cdn.telefonica.com no DNS primário de tv
	[ tags ]	dns	dns primario
    ${result} =     Run Process	nslookup	canoway-br.cdn.telefonica.com	${TV_DNS_PRI}		 
    Log    ${result.stdout}
    should be equal as integers	${result.rc} 	0
 
Resolução FQDN b41580.cdn.telefonica.com no DNS primário de tv
	[ tags ]	dns	dns primario
    ${result} =     Run Process	nslookup	b41580.cdn.telefonica.com	${TV_DNS_PRI}	 	 
    Log    ${result.stdout}
    should be equal as integers	${result.rc} 	0

Resolução FQDN sprd.br.op.gvp.telefonica.com no DNS primário de tv
	[ tags ]	dns	dns primario
    ${result} =     Run Process	nslookup	sprd.br.op.gvp.telefonica.com	${TV_DNS_PRI}	 	 
    Log    ${result.stdout}
    should be equal as integers	${result.rc} 	0
    
Resolução FQDN naplm.br.op.gvp.telefonica.com no DNS primário de tv
	[ tags ]	dns	dns primario
    ${result} =     Run Process	nslookup	naplm.br.op.gvp.telefonica.com	${TV_DNS_PRI}	 	 
    Log    ${result.stdout}
    should be equal as integers	${result.rc} 	0
    
Resolução FQDN dhep.br.op.gvp.telefonica.com no DNS primário de tv
	[ tags ]	dns	dns primario
    ${result} =     Run Process	nslookup	dhep.br.op.gvp.telefonica.com	${TV_DNS_PRI}	 	 
    Log    ${result.stdout}
    should be equal as integers	${result.rc} 	0
    
Resolução FQDN cota-b.cdn.telefonica.com no DNS primário de tv
	[ tags ]	dns	dns primario
    ${result} =     Run Process	nslookup	cota-b.cdn.telefonica.com	${TV_DNS_PRI}	 	 
    Log    ${result.stdout}
    
Resolução FQDN spotlight-br.cdn.telefonica.com no DNS primário de tv
	[ tags ]	dns	dns primario
    ${result} =     Run Process	nslookup	spotlight-br.cdn.telefonica.com	${TV_DNS_PRI}	 	 
    Log    ${result.stdout}
    should be equal as integers	${result.rc} 	0

Resolução FQDN telefonica.com no DNS secundario de tv
	[ tags ]	dns	dns secundario
    ${result} =     Run Process	nslookup	telefonica.com	${TV_DNS_SEC}	 	 
    Log    ${result.stdout}
    should be equal as integers	${result.rc} 	0
 
Resolução FQDN canoway-br.cdn.telefonica.com no DNS secundario de tv
	[ tags ]	dns	dns secundario
    ${result} =     Run Process	nslookup	canoway-br.cdn.telefonica.com	${TV_DNS_SEC}		 
    Log    ${result.stdout}
    should be equal as integers	${result.rc} 	0
 
Resolução FQDN b41580.cdn.telefonica.com no DNS secundario de tv
	[ tags ]	dns	dns secundario
    ${result} =     Run Process	nslookup	b41580.cdn.telefonica.com	${TV_DNS_SEC}	 	 
    Log    ${result.stdout}
    should be equal as integers	${result.rc} 	0

Resolução FQDN sprd.br.op.gvp.telefonica.com no DNS secundario de tv
	[ tags ]	dns	dns secundario
    ${result} =     Run Process	nslookup	sprd.br.op.gvp.telefonica.com	${TV_DNS_SEC}	 	 
    Log    ${result.stdout}
    should be equal as integers	${result.rc} 	0
    
Resolução FQDN naplm.br.op.gvp.telefonica.com no DNS secundario de tv
	[ tags ]	dns	dns secundario
    ${result} =     Run Process	nslookup	naplm.br.op.gvp.telefonica.com	${TV_DNS_SEC}	 	 
    Log    ${result.stdout}
    should be equal as integers	${result.rc} 	0
    
Resolução FQDN dhep.br.op.gvp.telefonica.com no DNS secundario de tv
	[ tags ]	dns	dns secundario
    ${result} =     Run Process	nslookup	dhep.br.op.gvp.telefonica.com	${TV_DNS_SEC}	 	 
    Log    ${result.stdout}
    should be equal as integers	${result.rc} 	0
    
Resolução FQDN cota-b.cdn.telefonica.com no DNS secundario de tv
	[ tags ]	dns	dns secundario
    ${result} =     Run Process	nslookup	cota-b.cdn.telefonica.com	${TV_DNS_SEC}	 	 
    Log    ${result.stdout}
    
Resolução FQDN spotlight-br.cdn.telefonica.com no DNS secundario de tv
	[ tags ]	dns	dns secundario
    ${result} =     Run Process	nslookup	spotlight-br.cdn.telefonica.com	${TV_DNS_SEC}	 	 
    Log    ${result.stdout}
    should be equal as integers	${result.rc} 	0

Ping para FCC - ${TV_FCC}
	[ tags ]	ping
      ${result} =     Run Process	ping 	${TV_FCC}	 -c	 3	-W	2
    Log    ${result.stdout}
    should contain	${result.stdout} 	3 received
    
Ping para Datahub - ${TV_DATAHUB}
	[ tags ]	ping
      ${result} =     Run Process	ping 	${TV_DATAHUB}	 -c	 3	-W	2
    Log    ${result.stdout}
    should contain	${result.stdout} 	3 received

Ping para RTCP Report Collector - ${TV_RTCP_COLLECTOR}
      ${result} =     Run Process	ping 	${TV_RTCP_COLLECTOR}	 -c	 3	-W	2
    Log    ${result.stdout}
    should contain	${result.stdout} 	3 received
    
Ping para spotlight-br.cdn.telefonica.com
	[ tags ]	ping
      ${result} =     Run Process	ping 	spotlight-br.cdn.telefonica.com	 -c	 3	-W	2
    Log    ${result.stdout}
    should contain	${result.stdout} 	3 received

Ping para cota-b.cdn.telefonica.com
	[ tags ]	ping
      ${result} =     Run Process	ping 	cota-b.cdn.telefonica.com	 -c	 3	-W	2
    Log    ${result.stdout}
    should contain	${result.stdout} 	3 received

#Reproduzir TV Educativa - 239.128.1.207
#	[ tags ]	multicast
#	[ timeout ]	10 seconds

#//keep application running after timeout
##      ${result} =     Run Process	vlc	rtp://@239.128.1.207:5002	timeout=10s	on_timeout=continue
 
#      ${result} =     Run Process	vlc	rtp://@239.128.1.207:5001	timeout=10s	
#    Log    ${result.stdout}
##  should contain	${result.stdout} 	3 received
     

Validate channel - ${mcast_ip}
	[ tags ]	multicast
    Join a channel      ${mcast_ip}
    Check if there is video
#    Grab screenshots as evidence       ${mcast_ip}


*** Keywords ***

Get ip for the test interface
    ${result} =     Execute Command	dhclient	-v	eth0	 
    Log    ${result.stdout}
    should contain	${result.stdout} 	bound to
 
Join a channel 
    [Arguments]    ${mcast_group}
    ${result} =     Run Process     cvlc rtp://@${mcast_group}:5001 --video-filter\=scene --scene-format\=jpg --scene-ratio\=24 --start-time\=0 --stop-time\=10 --scene-path\="/home/user/Documents/@projetos/robotframework/test/shell/evidences/screenshots" vlc://quit -vvv 2>&1 | tee temp/vlc_reproduction.log      shell=yes    timeout=5s
    Log    ${result.stdout} 

Check if there is video
    #[Documentation] Check in the logs of Join a channel it there is media descriptors for the stream (pid).
    ${result} =     Run Process     grep type\= temp/vlc_reproduction.log    shell=yes		stderr=STDOUT	
    Log    ${result.stdout}
    SHould be equal as integers		${result.rc}		0
    
