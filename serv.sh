a=0
lala=0
while :
do
	nc -l 2121 > tentesenha
	a=`cat tentesenha`
	while read lin
	do
		check=`echo $lin | grep $a | wc -l`
		if [ check -eq 0 ]
		then
			continue
		else
			if [ $lin = $a ]
			then
				lala=1
#				echo "1" > /dev/tcp/10.101.0.21/9999
			else
				continue
			fi
		fi
	done > senhas
#	b=`cat senhas | grep $a | wc -l`
	if [ $lala -eq 0 ];
	then
		echo "0" > /dev/tcp/10.101.0.22/9999
	else
		echo "1" > /dev/tcp/10.101.0.22/9999
	fi
done
