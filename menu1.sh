#Programa por davi e alexsander
#Projeto Agenda para alunos
clear
dialog \
	--title 'Agenda para Alunos' \
	--infobox '\nSeja bem-vindo' \
	0 0
sleep 1
op=$(dialog \
	--stdout \
	--menu 'Login' \
	0 18 0 \
	1 'Administrador' \
	2 'Usuário' \
	3 'Sair' )
case $op in
	3)
		clear
		echo "Programa encerrado"
		exit
		;;
	2)
#		echo aguarde atualização do programa
		./usr.sh
		;;
	1)
#		echo aguarde atualização do programa
		./adm.sh
		;;
esac
