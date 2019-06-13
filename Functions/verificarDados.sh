#!/bin/bash
#verificarDados.sh

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

function _verificarDados()

{
	#Verifica se o ficheiro my_tmp.txt existe, se não existir, cria-o	

	if [ ! -f $my_tmp ]
	then
		echo -e "\e[91mtmp.txt não existe, o ficheiro será criado\e[39m"
		touch $my_tmp
	fi

	#Verifica se o ficheiro my_tmp_dois.txt existe, se não existir, cria-o

	if [ ! -f $my_tmp_dois ]
	then
		echo -e "\e[91mtmp_dois.txt não existe, o ficheiro será criado\e[39m"
		touch $my_tmp_dois
	fi
	
	#Verifica se o ficheiro universidades.txt existe, se não existir, cria-o

	if [ ! -f $universidades ]
	then
		echo -e "\e[91muniversidades.txt não existe, o ficheiro será criado\e[39m"
		touch $universidades
	fi

	#Verifica se o ficheiro professores.txt existe, se não existir, cria-o

	if [ ! -f $professores ]
	then
		echo -e "\e[91mprofessores.txt não existe, o ficheiro será criado\e[39m"
		touch $professores
	fi

	#Verifica se o ficheiro disciplinas.txt existe, se não existir, cria-o

	if [ ! -f $disciplinas ]
	then
		echo -e "\e[91mdisciplinas.txt não existe, o ficheiro será criado\e[39m"
		touch $disciplinas
	fi

	#Verifica se o ficheiro estudantes.txt existe, se não existir, cria-o

	if [ ! -f $estudantes ]
	then
		echo -e "\e[91mestudantes.txt não existe, o ficheiro será criado\e[39m"
		touch $estudantes
	fi

	#Verifica se o ficheiro cursos.txt existe, se não existir, cria-o

	if [ ! -f $cursos ]
	then
		echo -e "\e[91mcursos.txt não existe, o ficheiro será criado\e[39m"
		touch $cursos
	fi
}

