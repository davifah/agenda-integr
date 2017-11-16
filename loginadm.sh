clear
while :
do
pswd=$(dialog \
	--title 'Administador' \
	--stdout \
	--passwordbox 'Digite sua senha' \
	0 0 )
echo 0:$pswd > /dev/tcp/10.101.0.22/2121
nc -l 9999 > res
a=`cat res`
if [ $a -eq 1 ];
then
	dialog \
		--title 'Administrador' \
		--msgbox 'Logado com sucesso' \
		0 0
	./adm.sh
else
	dialog \
		--title 'Administrador' \
		--msgbox 'Falha no login' \
		0 0
fi
done
