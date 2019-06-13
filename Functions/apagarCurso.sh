#!/bin/bash
#apagarCurso.sh

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

function _apagarCurso()
{
	echo -e "\e[93mApagar dados de cursos"

	echo -e "	\e[39m"

	echo -e "	"

	echo -e "Introduza o id do curso que deseja apagar (lembre-se de usar underscore (_) no lugar dos espaços)"
	read curso_id
	let confirmar=0

	#Leitura do ficheiro cursos.txt

	while IFS=: read -r  ler_id ler_uni ler_curso ler_disciplina_um ler_disciplina_dois ler_disciplina_tres ler_disciplina_quatro ler_disciplina_cinco
	do
		#caso o id introduzido seja válido, incrementa-se a variável confirmar

		if [ $ler_id = $curso_id ]
		then
			let confirmar++
		fi
	done < $cursos
	
	#caso a variável confirmar não tenha sido incrementada

	if [ $confirmar -eq 0 ]
 	then
		echo -e "\e[91mCurso inválido, operação interrompida\e[39m"
	
	#caso a variável confirmar tenha sido incrementada

	else

		#Obtenção do nome do curso através do ID	

		curso_nome=$(grep "$curso_id" $cursos | cut -d : -f 3)

		#Leitura do ficheiro cursos.txt

		while IFS=: read -r  ler_id_two ler_uni_two ler_curso_two ler_disciplina_um_two ler_disciplina_dois_two ler_disciplina_tres_two ler_disciplina_quatro_two ler_disciplina_cinco_two
			do

				#caso o id dos cursos correspondam
				if [ $ler_id_two = $curso_id ]
				then

					#Leitura do ficheiro disciplinas.txt

					while IFS=: read -r  ler_id_dois ler_nome_dois ler_curso_dois ler_inscritos_dois
					do

						#caso os ids dos cursos correpondam, nada acontece
						if [ $ler_curso_dois = $curso_nome ]
						then
							let descartavel++

						#caso contrário, escreve-se o conteúdo das disciplinas no ficheiro tmp_dois.txt

						else
							echo -e "$ler_id_dois:$ler_nome_dois:$ler_curso_dois:$ler_inscritos_dois" >> $my_tmp_dois
						fi		
					done < $disciplinas

					#move-se o conteúdo do ficheiro tmp_dois.txt para o ficheiro disciplinas.txt

					mv $my_tmp_dois $disciplinas
					touch $my_tmp_dois

				#caso contrário, escreve-se o conteúdo dos cursos no ficheiro tmp.txt

				else
					echo -e "$ler_id_two:$ler_uni_two:$ler_curso_two:$ler_disciplina_um_two:$ler_disciplina_dois_two:$ler_disciplina_tres_two:$ler_disciplina_quatro_two:$ler_disciplina_cinco_two" >> $my_tmp
				fi		
			done < $cursos

		#Move-se o conteúdo do ficheiro tmp.txt para o ficheiro cursos.txt

		mv $my_tmp $cursos
		touch $my_tmp

		#leitura do ficheiro professores.txt

		while IFS=: read -r  ler_id_six ler_nome_six ler_uni_six ler_curso_six ler_disciplina_six
		do
		
			#caso o nome da universidade e o nome lido sejam iguais, nada acontece

			if [[ $ler_curso_six = $curso_nome ]]
			then
				let descartavel++

			#caso não sejam iguais, escreve-se o conteúdo dos professores no ficheiro tmp.txt		

			else
				echo -e "$ler_id_six:$ler_nome_six:$ler_uni_six:$ler_curso_six:$ler_disciplina_six" >> $my_tmp
			fi
		done <$professores

		#move-se o conteúdo do ficheiro tmp.txt para o ficheiro professores.txt

		mv $my_tmp $professores
		touch $my_tmp

		#leitura do ficheiro professores.txt

		while IFS=: read -r  ler_id_six ler_nome_six ler_uni_six ler_curso_six ler_disciplina_six
		do
		
			#caso o nome da universidade e o nome lido sejam iguais, nada acontece

			if [[ $ler_uni_six = $uni_name ]]
			then
				let descartavel++

			#caso não sejam iguais, escreve-se o conteúdo dos professores no ficheiro tmp.txt		

			else
				echo -e "$ler_id_six:$ler_nome_six:$ler_uni_six:$ler_curso_six:$ler_disciplina_six" >> $my_tmp
			fi
		done <$professores

		#move-se o conteúdo do ficheiro tmp.txt para o ficheiro professores.txt

		mv $my_tmp $professores
		touch $my_tmp

		#leitura do ficheiro estudantes.txt

		while IFS=: read -r  ler_id_seven ler_nome_seven ler_uni_seven ler_curso_seven
		do
		
			#caso o nome da universidade e o nome lido sejam iguais, nada acontece

			if [[ $ler_curso_seven = $curso_nome ]]
			then
				let descartavel++

			#caso não sejam iguais, escreve-se o conteúdo dos estudantes no ficheiro tmp.txt		

			else
				echo -e "$ler_id_seven:$ler_nome_seven:$ler_uni_seven:$ler_curso_seven" >> $my_tmp
			fi
		done <$estudantes

		#move-se o conteúdo do ficheiro tmp.txt para o ficheiro estudantes.txt

		mv $my_tmp $estudantes
		touch $my_tmp


		echo ""
		echo -e "\e[32mCurso apagado com sucesso\e[39m"
	fi
}
