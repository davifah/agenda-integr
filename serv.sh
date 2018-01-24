#Programa por davi e alexsander
#Projeto Agenda para alunos
ipagoranao=127.0.0.1
portaserv=9999
portaclien=9998
check=0
a=0
lala=0
while :
do
 	nc -l $portaserv > inf
	ch=`cat inf | cut -d":" -f1`
	i=`cat inf | cut -d":" -f2`
	case $ch in
		0)
			while read lin
			do
				check=`echo $lin | grep $i | wc -l`
				if [ $check -eq 0 ]
				then
					continue
				else
					if [ $lin == $i ]
					then
						lala=1
					else
						continue
					fi
				fi
			done < senhas
			if [ $lala -eq 0 ];
		 	then
				echo "0" > /dev/tcp/$ipagoranao/$portaclien
		 	else
				echo "1" > /dev/tcp/$ipagoranao/$portaclien
 			fi
			;;
		1)
			cat calen > /dev/tcp/$ipagoranao/$portaclien
			;;
		2)
			nc -w 3 $ipagoranao $portaclien < sobre.txt
#			echo `cat fotop.jpg` > /dev/tcp/$ipagoranao/$portaclien
			nc -w 3 $ipagoranao $portaclien < fotop.jpg
			;;

	esac
done
