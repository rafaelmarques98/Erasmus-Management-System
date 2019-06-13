#!/bin/bash
#registoUniversidade.sh

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

function _registoUniversidade()
{
	echo -e "Introduza o nome da universidade (use o underscore (_) no lugar do espaço)"
	read universidade_nome
	echo -e "Introduza a localização da universidade (use o underscore (_) no lugar do espaço)"
	read universidade_localizacao

	#obtenção da primeira coluna da última linha do ficheiro universidades.txt, ou seja, o ultimo id registado

	universidade_id=$(tail -1 $universidades | cut -d : -f 1)

	#incrementa-se o id

	let universidade_id++

	#escreve-se os dados relativos á universidades a registar no ficheiro universidades.txt

	echo -e "$universidade_id:$universidade_nome:$universidade_localizacao" >> $universidades	

	#organiza o ficheiro universidades.txt por ordem crescente de id	

	sort -n $universidades > $my_tmp
	mv $my_tmp $universidades
	touch $my_tmp

	echo ""
	echo -e "\e[32mUniversidade adicionada com sucesso\e[39m"
}

