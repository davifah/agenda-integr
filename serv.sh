a=0
while :
do
	nc -l 2121 > tentesenha
	a=`cat tentesenha`
	b=`cat senhas | grep $a | wc -l`
	if [ $b -eq 0 ];
	then
		echo "0" > /dev/tcp/10.101.0.21/9999
	else
		echo "1" > /dev/tcp/10.101.0.21/9999
	fi
done
