ipagoranao=10.101.0.15
check=0
a=0
lala=0
while :
do
 	nc -l 9999 > inf
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
				echo "0" > /dev/tcp/$ipagoranao/9999
		 	else
				echo "1" > /dev/tcp/$ipagoranao/9999
 			fi
			;;
		1)
			cat calen > /dev/tcp/$ipagoranao/9999
			;;
		2)
			echo `cat sobre.txt` > /dev/tcp/$ipagoranao/9999
			echo `cat fotop.jpg` > /dev/tcp/$ipagoranao/9999
			;;

	esac
done
