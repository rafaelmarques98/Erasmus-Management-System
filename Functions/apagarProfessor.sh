#!/bin/bash
#apagarProfessor.sh

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

function _apagarProfessor()
{
	
	echo -e "\e[93mApagar dados de professores"

	echo -e "	\e[39m"

	echo -e "	"

	echo -e "Introduza o id do professor que deseja apagar (lembre-se de usar underscore (_) no lugar dos espaços)"
	read teacher_id
	let confirmar=0

	#Leitura do ficheiro professores.txt

	while IFS=: read -r  ler_id ler_nome ler_uni ler_curso ler_disciplina
	do
		#caso o id introduzido seja válido, incrementa-se a variável confirmar

		if [ $ler_id = $teacher_id ]
		then
			let confirmar++
		fi
	done < $professores
	
	#caso a variável confirmar não tenha sido incrementada

	if [ $confirmar -eq 0 ]
 	then
		echo -e "\e[91mProfessor inválido, operação interrompida\e[39m"
	
	#caso a variável confirmar tenha sido incrementada

	else

		#Leitura do ficheiro professores.txt

		while IFS=: read -r  ler_id ler_nome ler_uni ler_curso ler_disciplina
			do

				#caso o id da universidade corresponda id introduzido, nada acontece
				if [ $ler_id = $teacher_id ]
				then
					let descartavel++

				#caso nao correspondam, escreve-se o conteúdo dos professores no ficheiro tmp.txt

				else
					echo -e "$ler_id:$ler_nome:$ler_uni:$ler_curso:$ler_disciplina" >> $my_tmp
				fi		
			done < $professores
		
		#move-se o conteúdo do ficheiro tmp.txt para o ficheiro professores.txt

		mv $my_tmp $professores
		touch $my_tmp

		echo ""
		echo -e "\e[32mProfessor apagada com sucesso\e[39m"
	fi	
}
