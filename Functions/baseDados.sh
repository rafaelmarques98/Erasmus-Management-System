#!/bin/bash
#baseDados.sh

directory=$(pwd)
home="$basename "$directory""
universidades="$home/Dados/universidades.txt"
professores="$home/Dados/professores.txt"
estudantes="$home/Dados/estudantes.txt"
disciplinas="$home/Dados/disciplinas.txt"
cursos="$home/Dados/cursos.txt"
universidades_backup="$home/Backup/universidades.bak"
professores_backup="$home/Backup/professores.bak"
estudantes_backup="$home/Backup/estudantes.bak"
disciplinas_backup="$home/Backup/disciplinas.bak"
cursos_backup="$home/Backup/cursos.bak"
my_tmp="$home/Dados/tmp.txt"
my_tmp_dois="$home/Dados/tmp_dois.txt"

function _criarBackup()
{
	echo "Quais os dados que deseja salvaguardar?"

	echo -e "\e[39m   "	

	echo -e "   \e[96m 1\e[39m- Universidades"

	echo -e "   \e[96m 2\e[39m- Professores"

	echo -e "   \e[96m 3\e[39m- Estudantes"

	echo -e "   \e[96m 4\e[39m- Disciplinas"

	echo -e "   \e[96m 5\e[39m- Cursos"

	echo -e "   \e[96m 6\e[39m- Todos"

	echo -e "   "

	echo -e "   \e[96m 0\e[39m- Sair do programa"

	echo -e "   "

	echo -e "   Introduza a opção>"
	read opcao_quais
	case $opcao_quais in
		1)
		echo -e "..."
		cp $universidades $universidades_backup
		echo -e ""
		echo -e "\e[32mCópia de Segurança Criada\e[39m"
		;;
		2)
		echo "..."
		cp $professores $professores_backup
		echo -e ""
		echo -e "\e[32mCópia de Segurança Criada\e[39m"
		;;
		3)
		echo "..."
		cp $estudantes $estudantes_backup
		echo -e ""
		echo -e "\e[32mCópia de Segurança Criada\e[39m"
		;;
		4)
		echo "..."
		cp $disciplinas $disciplinas_backup
		echo ""
		echo -e "\e[32mCópia de Segurança Criada\e[39m"
		;;
		5)
		echo -e "..."
		cp $cursos $cursos_backup
		echo ""
		echo -e "\e[32mCópia de Segurança Criada\e[39m"
		;;
		6)
		echo -e "..."
		cp $universidades $universidades_backup
		echo -e ""
		echo "..."
		cp $professores $professores_backup
		echo -e ""
		echo "..."
		cp $estudantes $estudantes_backup
		echo -e ""
		echo "..."
		cp $disciplinas $disciplinas_backup
		echo ""
		echo -e "..."
		cp $cursos $cursos_backup
		echo -e "\e[32mCópia de Segurança Criada\e[39m"
		echo ""
		;;
		0)
		echo -e "Retornando ao menu principal..."
		echo -e " "
		;;
		*)
		echo -e "\e[91mOpção inválida\e[39m"
		echo -e ""
		;;
	#fim do case para guardar
	esac
}

function _restaurarBackup()
{
	echo "Quais os dados que deseja restaurar?"
	echo -e "\e[39m   "	

	echo -e "   \e[96m 1\e[39m- Universidades"

	echo -e "   \e[96m 2\e[39m- Professores"

	echo -e "   \e[96m 3\e[39m- Estudantes"

	echo -e "   \e[96m 4\e[39m- Disciplinas"

	echo -e "   \e[96m 5\e[39m- Cursos"

	echo -e "   \e[96m 6\e[39m- Todos"

	echo -e "   "

	echo -e "   \e[96m 0\e[39m- Sair do programa"

	echo -e "   "

	echo -e "   Introduza a opção>"
	read opcao_quais
	case $opcao_quais in
		1)
		if [ ! -f $universidades_backup ]
		then
			echo -e "\e[91mNão existe nenhuma cópia de segurança das universidades\e[39m"
		
		else
			echo -e "..."
			cp $universidades_backup $universidades
			echo -e ""
			echo -e "\e[32mCópia de Segurança Restaurada\e[39m"
		fi
		;;
		2)
		if [ ! -f $professores_backup ]
		then
			echo -e "\e[91mNão existe nenhuma cópia de segurança dos professores\e[39m"
		
		else
			echo "..."
			cp $professores_backup $professores
			echo -e ""
			echo -e "\e[32mCópia de Segurança Restaurada\e[39m"
		fi
		;;
		3)
		if [ ! -f $estudantes_backup ]
		then
			echo -e "\e[91mNão existe nenhuma cópia de segurança dos estudantes\e[39m"
		else
			echo "..."
			cp $estudantes_backup $estudantes
			echo -e ""
			echo -e "\e[32mCópia de Segurança Restaurada\e[39m"
		fi			
		;;
		4)
		if [ ! -f $disciplinas_backup ]
		then
			echo -e "\e[91mNão existe nenhuma cópia de segurança das disciplinas\e[39m"
		else
			echo "..."
			cp $disciplinas_backup $disciplinas
			echo ""
			echo -e "\e[32mCópia de Segurança Restaurada\e[39m"
		fi	
		;;
		5)
		if [ ! -f $cursos_backup ]
		then
			echo -e "\e[91mNão existe nenhuma cópia de segurança dos cursos\e[39m"
		else
			echo -e "..."
			cp $cursos_backup $cursos
			echo ""
			echo -e "\e[32mCópia de Segurança Restaurada\e[39m"
		fi	
		;;
		6)
		if [ ! -f $universidades_backup ] || [ ! -f $professores_backup ] || [ ! -f $estudantes_backup ] || [ ! -f $disciplinas_backup ] || [ ! -f $cursos_backup ]
		then
			echo -e "\e[91mO backup de um dos ficheiros pode estar em falta\e[39m"
		
		else
			echo -e "..."
			cp $universidades_backup $universidades
			echo -e ""
			echo "..."
			cp $professores_backup $professores
			echo -e ""
			echo "..."
			cp $estudantes_backup $estudantes
			echo -e ""
			echo "..."
			cp $disciplinas_backup $disciplinas
			echo ""
			echo -e "..."
			cp $cursos_backup $cursos
			echo -e "\e[32mCópia de Segurança Restaurada\e[39m"
			echo ""
		fi	
		;;
		0)
		echo -e "Retornando ao menu principal..."
		echo -e " "
		;;
		*)
		echo -e "\e[91mOpção inválida\e[39m"
		echo -e ""
		;;
	#fim do case para restaurar
	esac
}

function _eliminarBackup()
{
	echo "Quais os dados que deseja eliminar?"
	echo -e "\e[39m   "	

	echo -e "   \e[96m 1\e[39m- Universidades"

	echo -e "   \e[96m 2\e[39m- Professores"

	echo -e "   \e[96m 3\e[39m- Estudantes"

	echo -e "   \e[96m 4\e[39m- Disciplinas"

	echo -e "   \e[96m 5\e[39m- Cursos"

	echo -e "   \e[96m 6\e[39m- Todos"

	echo -e "   "

	echo -e "   \e[96m 0\e[39m- Sair do programa"

	echo -e "   "

	echo -e "   Introduza a opção>"
	read opcao_quais
	case $opcao_quais in
		1)
		echo -e "..."
		rm $universidades_backup
		echo -e ""
		echo -e "\e[32mCópia de Segurança Eliminada\e[39m"
		;;
		2)
		echo -e "..."
		rm $professores_backup
		echo -e ""
		echo -e "\e[32mCópia de Segurança Eliminada\e[39m"
		;;
		3)
		echo -e "..."
		rm $estudantes_backup
		echo -e ""
		echo -e "\e[32mCópia de Segurança Eliminada\e[39m"
		;;
		4)
		echo -e "..."
		rm $disciplinas_backup
		echo -e ""
		echo -e "\e[32mCópia de Segurança Eliminada\e[39m"
		;;
		5)
		echo -e "..."
		rm $cursos_backup
		echo -e ""
		echo -e "\e[32mCópia de Segurança Eliminada\e[39m"
		;;
		6)
		echo -e "..."
		rm $universidades_backup
		echo -e ""
		echo "..."
		rm $professores_backup
		echo -e ""
		echo "..."
		rm $estudantes_backup
		echo -e ""
		echo "..."
		rm $disciplinas_backup
		echo ""
		echo -e "..."
		rm $cursos_backup
		echo -e "\e[32mCópia de Segurança Eliminada\e[39m"
		echo ""
		;;
		0)
		echo -e "Retornando ao menu principal..."
		echo -e " "
		;;
		*)
		echo -e "\e[91mOpção inválida\e[39m"
		echo -e ""
		;;
	#fim do case para eliminar
	esac
}
