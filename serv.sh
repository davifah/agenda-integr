check=0
a=0
lala=0
while :
do
 	nc -l 2121 > inf
	check=`cat inf | cut -d":" -f1`
	i=`cat inf | cut -d":" -f2`
	if [ $check -eq 0 ] #senha
	then
		while read lin
		do
			check=`echo $lin | grep $a | wc -l`
			if [ $check -eq 0 ]
			then
				continue
			else
				if [ $lin == $a ]
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
		
	fi
done
