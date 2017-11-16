clear
echo 1: > /dev/tcp/10.101.0.22/9999
nc -l 9999 > calen
echo -e "   Código      Data               Informação"
while read lin
do
	cod=`echo $lin | cut -d"#" -f2`
	data=`echo $lin | cut -d"#" -f3`
	inf=`echo $lin | cut -d"#" -f4`
	echo -e "   "$cod"        "$data"             "$inf
done < calen
read -p "Press ENTER to continue..."
