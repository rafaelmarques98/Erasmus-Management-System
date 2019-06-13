#!/bin/bash
#registoCurso.sh

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

function _registoCurso()
{
	echo -e "Introduza o nome do curso (use o underscore (_) no lugar do espaço)"
	read curso_nome

	#obtenção da primeira coluna da última linha do ficheiro curso.txt, ou seja, o ultimo id registado	

	curso_id=$(tail -1 $cursos | cut -d : -f 1)

	#incrementa-se o id

	let curso_id++
	
	echo -e "A que universidade pertence o curso?"
	read curso_universidade

	echo -e "Deverá introduzir as 5 disciplinas do curso"
	echo -e " "
	echo -e "Introduza a primeira disciplina"
	read disciplina_um
	echo -e " "
	echo -e "Introduza a segunda disciplina"
	read disciplina_dois
	echo -e " "
	echo -e "Introduza a terceira disciplina"
	read disciplina_tres
	echo -e " "
	echo -e "Introduza a quarta disciplina"
	read disciplina_quatro
	echo -e " "
	echo -e "Introduza a quinta disciplina"
	read disciplina_cinco

	

	let confirmar=0 

	#leitura do ficheiro universidades.txt	

	while IFS=: read -r  ler_id ler_nome ler_local
	do

		#caso a universidade inserida seja válida, a variável confirmar é incrementada

		if [ $ler_nome = $curso_universidade ]
		then
			let confirmar++
		fi
	done < $universidades

	#caso a variável confirmar não tenha sido incrementada

	if [ $confirmar -eq 0 ]
 	then
		echo -e "\e[91mUniversidade inexistente, o curso não foi adicionado\e[39m"
	
	#caso a variável confirmar tenha sido incrementada

	else

		#escreve-se os dados relativos ao cursos a registar no ficheiro cursos.txt	
		
		echo -e "$curso_id:$curso_universidade:$curso_nome:$disciplina_um:$disciplina_dois:$disciplina_tres:$disciplina_quatro:$disciplina_cinco" >> $cursos

		let disciplinas_inscritos=0

		#obtenção da primeira coluna da última linha do ficheiro disciplinas.txt, ou seja, o ultimo id registado

		disciplinas_id=$(tail -1 $disciplinas | cut -d : -f 1)

		#incrementa-se o id

		let disciplinas_id++

		#escrevem-se os dados no ficheiro disciplinas.txt

		echo -e "$disciplinas_id:$disciplina_um:$curso_nome:$disciplinas_inscritos" >> $disciplinas

		let disciplinas_id++

		echo -e "$disciplinas_id:$disciplina_dois:$curso_nome:$disciplinas_inscritos" >> $disciplinas

		let disciplinas_id++

		echo -e "$disciplinas_id:$disciplina_tres:$curso_nome:$disciplinas_inscritos" >> $disciplinas

		let disciplinas_id++

		echo -e "$disciplinas_id:$disciplina_quatro:$curso_nome:$disciplinas_inscritos" >> $disciplinas

		let disciplinas_id++

		echo -e "$disciplinas_id:$disciplina_cinco:$curso_nome:$disciplinas_inscritos" >> $disciplinas

		echo ""
		echo -e "\e[32mCurso adicionado com sucesso\e[39m"

	fi

	

	#organiza o ficheiro cursos.txt por ordem crescente de id

	sort -n $cursos > $my_tmp
	mv $my_tmp $cursos
	touch $my_tmp
	#organiza o ficheiro disciplinas.txt por ordem crescente de id

	sort -n $disciplinas > $my_tmp
	mv $my_tmp $disciplinas
	touch $my_tmp
}




