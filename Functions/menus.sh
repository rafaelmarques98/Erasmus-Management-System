#!/bin/bash
#menus.sh

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

function _menuPrincipal()
{
	echo -e "\e[93mMenu Principal"

	echo -e "\e[39m   "	

	echo -e "   \e[96m 1 \e[39m- Registo"

	echo -e "   \e[96m 2 \e[39m- Alterar Dados "

	echo -e "   \e[96m 3 \e[39m- Apagar Dados "

	echo -e "   \e[96m 4 \e[39m- Visualizar Dados "
 
	echo -e "   \e[96m 5 \e[39m- Gestão do(s) ficheiro(s) de Base de Dados "

	echo -e "   "

	echo -e "   \e[96m 0 \e[39m- Sair do programa"

	echo -e "   "

	echo -e "   Introduza a opção>"

}

function _menuRegisto()
{
	echo -e "\e[93mRegisto\e[39m"

	echo -e "   "

	echo -e "   \e[96m 1\e[39m- Universidades "

	echo -e "   \e[96m 2\e[39m- Professores "

	echo -e "   \e[96m 3\e[39m- Estudantes "

	echo -e "   \e[96m 4\e[39m- Cursos "

	echo -e "   "

	echo -e "   \e[96m 0\e[39m- Sair para o menu principal"

	echo -e "   "

	echo -e "   Introduza a opção>"
}

function _menuAlterar()
{
	echo -e "\e[93mAlterar Dados"

	echo -e "\e[39m   "

	echo -e "   \e[96m 1\e[39m- Universidades "

	echo -e "   \e[96m 2\e[39m- Professores "

	echo -e "   \e[96m 3\e[39m- Estudantes"

	echo -e "   \e[96m 4\e[39m- Disciplinas "

	echo -e "   \e[96m 5\e[39m- Cursos "

	echo -e "   "

	echo -e "   \e[96m 0\e[39m- Sair para o menu principal "

	echo -e "   "

	echo -e "   Introduza a opção>"
}

function _menuApagar()
{
	echo -e "\e[93mApagar Dados"

	echo -e "\e[39m   "

	echo -e "   \e[96m 1\e[39m- Universidades "

	echo -e "   \e[96m 2\e[39m- Professores "

	echo -e "   \e[96m 3\e[39m- Estudantes"

	echo -e "   \e[96m 4\e[39m- Cursos "

	echo -e "   "

	echo -e "   \e[96m 0\e[39m- Sair para o menu principal "

	echo -e "   "

	echo -e "   Introduza a opção>"
}

function _menuVisualizar()
{
	echo -e "\e[93mVisualizar Dados"

	echo -e "\e[39m   "	

	echo -e "   \e[96m 1\e[39m- Listar universidades"

	echo -e "   \e[96m 2\e[39m- Listar disciplinas "

	echo -e "   \e[96m 3\e[39m- Listar Alunos Erasmus"

	echo -e "   \e[96m 4\e[39m- Listar disciplinas com alunos Inscritos"

	echo -e "   \e[96m 5\e[39m- Listar professores"

	echo -e "   \e[96m 6\e[39m- Listar Cursos"

	echo -e "   "

	echo -e "   \e[96m 0\e[39m- Sair do programa"

	echo -e "   "

	echo -e "   Introduza a opção>"
}

function _menuBaseDados()
{
	echo -e "\e[93mGestão De Base De Dados"

	echo -e "\e[39m   "	

	echo -e "   \e[96m 1\e[39m- Backup-Criar uma cópia de segurança"

	echo -e "   \e[96m 2\e[39m- Restaurar uma cópia de segurança"

	echo -e "   \e[96m 3\e[39m- Apagar uma cópia de segurança"

	echo -e "   "

	echo -e "   \e[96m 0\e[39m- Sair do programa"

	echo -e "   "

	echo -e "   Introduza a opção>"
}



