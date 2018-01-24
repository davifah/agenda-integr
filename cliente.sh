#Programa por davi e alexsander
#Projeto Agenda para alunos
ip1234=127.0.0.1
portaserv=9999
portaclien=9998
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
	retval=$?
	case $retval in
		1)
			clear
			echo "Programa encerrado"
			exit
			;;
		255)
			clear
			echo "Programa encerrado"
			exit
			;;
	esac
	case $op in
		3)
			clear
			echo "Programa encerrado"
			exit
			;;
		2)
			while :
			do
			op=$(dialog \
			        --stdout \
			        --menu 'Menu de Usuário' \
			        0 0 0 \
			        1 'Visualizar agenda' \
			        2 'Sobre' \
				3 'Sair' )
				retval=$?
				case $retval in
					1)
						clear
						echo "Programa encerrado"
						exit
						;;
					255)
						clear
						echo "Programa encerrado"
						exit
						;;
				esac
				case $op in
			        3)
			                clear
					echo "Programa encerrado"
					break
					;;
				2)
					echo 2: > /dev/tcp/$ip1234/$portaserv
					(dialog  \
						--title 'Aguarde'\
						--infobox '\nFinalizando download...'\
						0 0)
					nc -l $portaclien > sobre
					nc -lp $portaclien > pic.jpg
					loc=`pwd`
                                        (dialog \
                                                --title 'SOBRE' \
                                                --textbox $loc/sobre 0 0 )
					display pic.jpg
					;;
				1)
					clear
					echo 1: > /dev/tcp/$ip1234/$portaserv
					nc -l $portaclien > calen
					echo -e "   Código      Data               Informação"
					while read lin
					do
						cod=`echo $lin | cut -d"#" -f2`
						data=`echo $lin | cut -d"#" -f3`
						inf=`echo $lin | cut -d"#" -f4`
						echo -e "   "$cod"        "$data"             "$inf
					done < calen
					read -p "Pressione ENTER para continuar..."
					;;
			esac
		done
		exit
		;;
	1)
		clear
		while :
		do
		pswd=$(dialog \
			--title 'Administador' \
			--stdout \
			--passwordbox 'Digite sua senha' \
			0 0 )
		retval=$?
		case $retval in
			1)
				clear
				echo "Programa encerrado"
				exit
				;;
			255)
				clear
				echo "Programa encerrado"
				exit
				;;
		esac
		echo 0:$pswd > /dev/tcp/$ip1234/$portaserv
		nc -l $portaclien > res
		a=`cat res`
		if [ $a -eq 1 ];
		then
			dialog \
				--title 'Administrador' \
				--infobox '\nLogado com sucesso' \
				0 0
			sleep 0.5s
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
				        5 'Sobre' \
					6 'Sair' )
				retval=$?
				case $retval in
					1)
						clear
						echo "Programa encerrado"
						exit
						;;
					255)
						clear
						echo "Programa encerrado"
						exit
						;;
				esac
				case $op in
				        6)
				                clear
						echo "Programa encerrado"
						exit
				                ;;
					5)
						echo 2: > /dev/tcp/$ip1234/$portaserv
						(dialog  \
							--title 'Aguarde'\
							--infobox '\nFinalizando download...'\
							0 0)
						nc -l $portaclien > sobre
						nc -lp $portaclien > pic.jpg
						loc=`pwd`
                	                        (dialog \
                	                                --title 'SOBRE' \
                	                                --textbox $loc/sobre 0 0 )
						display pic.jpg
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
						echo 1: > /dev/tcp/$ip1234/$portaserv
						nc -l $portaclien > calen
						echo -e "   Código      Data               Informação"
						while read lin
						do
							cod=`echo $lin | cut -d"#" -f2`
							data=`echo $lin | cut -d"#" -f3`
							inf=`echo $lin | cut -d"#" -f4`
							echo -e "   "$cod"        "$data"             "$inf
						done < calen
						read -p "Press ENTER to continue..."
						;;
				esac
			done
exit
			exit
		else
			dialog \
				--title 'Administrador' \
				--msgbox 'Falha no login' \
				0 0
		fi
		done
		;;
esac
