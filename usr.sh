while :
do
	op=$(dialog \
	        --stdout \
	        --menu 'Menu de Usuário' \
	        0 0 0 \
	        1 'Visualizar agenda' \
	        2 'Sair' )
	case $op in
	        2)
	                clear
			echo "Programa encerrado"
			break
			;;
		1)
			clear
			./visu.sh
			;;
	esac
done
exit

