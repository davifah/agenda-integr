while :
do
	op=$(dialog \
	        --stdout \
	        --menu 'Menu de Administrador' \
	        0 0 0 \
	        1 'Visualizar agenda' \
	        2 'Excluir item' \
		3 'Adicionar novo item' \
		4 'Modificar senha de líder' \
	        5 'Sair' )
	case $op in
	        5)
	                clear
			echo "Programa encerrado"
	                break
	                ;;
	        4)
			clear
			echo "Modificar senha -- aguardar att"
			;;
	        3)
	                clear
	                echo "Adicionar -- aguardar att"
	                ;;
	        2)
	                clear
	                echo "Excluir -- aguardar att"
	                ;;
		1)
			clear
	                echo "Visualizar -- aguardar att"
	                ;;
	esac
done
exit
