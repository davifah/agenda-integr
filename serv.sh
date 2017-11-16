check=0
a=0
lala=0
while :
do
 	nc -l 2121 > inf
	ch=`cat inf | cut -d":" -f1`
	i=`cat inf | cut -d":" -f2`
	if [ $ch -eq 0 ] #senha
	then
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
			echo "0" > /dev/tcp/10.101.0.21/9999
	 	else
			echo "1" > /dev/tcp/10.101.0.21/9999
 		fi
	else
		if [ $ch -eq 1 ]
		then
			cat calen > /dev/tcp/10.101.0.21/9999
		else
			echo oi
		fi
	fi
done
