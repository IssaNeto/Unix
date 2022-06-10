#!/bin/ksh

hostname="`hostname`"
so="`oslevel -s`"

#####################################################

arch="x64"

## Endereço IP placa en0
ip="`ifconfig en0 | grep inet | awk '{print $2}'`"

## Default Gateway
gw="`netstat -r | grep default | awk '{print $2}'`"

#####################################################netmask=$(cat $eth0 | grep NETMASK | awk '{print $1}' | cut -d "=" -f2)




## MAC Address placa en0
hwaddr="`lscfg -vl ent0 | grep Address | cut -b 37-50`"


DNS1_resp1=" "
DNS2_resp2=" "

# Quantidade de Memória
rmem="`prtconf | grep Good | awk '{print $4}'`"

http=" "

## % de Espaço em Uso dos Files Systems
df1=$(df | grep / | awk '{print $4}')

## Nome dos Files Systems
df=$(df | grep / | awk '{print $7}')

## Quantidade de Processadores
cpu="`prtconf | grep Processors | cut -f 2 -d :`"


home="`ls -l / | awk '{print $9}'`"
opt="`ls -l /opt | awk '{print $9}'`"
ibm="`ls -l /opt/ibm | awk '{print $9}'`"
IBM="`ls -l /opt/IBM | awk '{print $9}'`"

oracle=$(env | grep oracle )
java=$(env | grep java)

processojava="`ps -ef | grep java | awk '{print $9}'`"

processohttp=$(ps -ef | grep http | awk '{print $8,$9}')




echo "Hostname|so|Arquitetura|ip|gw|netmask|hwaddr|DNS1|DNS2|Memoria Total|httpd |processohttp |home|opt|ibm|IBM|oracle|processojava|java|cpu "  >> $hostname.txt

echo $hostname "|" $so "|" $arch "|" $ip "|" $gw "|" $netmask "|" $hwaddr "|" $DNS1_resp1 "|" $DNS2_resp1 "|" $rmem "|" $http "|" $processohttp "|" $home "|" $opt "|" $ibm "|" $IBM "|" $oracle "|" $processojava "|" $java "|" $cpu  >> $hostname.txt




