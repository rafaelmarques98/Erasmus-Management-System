#!/bin/bash
#apagarUniversidade.sh

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

function _apagarUniversidade()
{
	echo -e "\e[93mApagar dados de universidades"

	echo -e "	\e[39m"

	echo -e "	"

	echo -e "Introduza o id da universidade que deseja apagar (lembre-se de usar underscore (_) no lugar dos espaços)"
	read university_id

	#Obtenção do nome da universidade a partir do id

	uni_name=$(grep "$university_id" $universidades | cut -d : -f 2)

	let confirmar=0

	#leitura do ficheiro universidades.txt

	while IFS=: read -r  ler_id ler_nome ler_localizacao
	do
		#caso o id introduzido seja válido, incrementa-se a variável confirmar

		if [ $ler_id = $university_id ]
		then
			let confirmar++
		fi
	done < $universidades
	
	#caso a variável confirmar não tenha sido incrementada

	if [ $confirmar -eq 0 ]
 	then
		echo -e "\e[91mUniversidade inválida, operação interrompida\e[39m"
	
	#caso a variável confirmar tenha sido incrementada

	else


		#leitura do ficheiro universidades.txt
			
		while IFS=: read -r  ler_id_four ler_nome_four ler_localidade_four
			do

				#caso o id da universidade corresponda id introduzido, nada acontece
				if [ $ler_id_four = $university_id ]
				then
					let descartavel++

				#caso contrário, escreve-se o conteúdo de universidades no ficheiro tmp.txt 

				else
					echo -e "$ler_id_four:$ler_nome_four:$ler_localidade_four" >> $my_tmp
				
				fi		
			done < $universidades

		#move-se o conteúdo do tmp.txt para o universidades.txt

		mv $my_tmp $universidades
		touch $my_tmp
	
		#após se mover o ficheiro este desaparece, logo usa-se o comando touch para o criar de novo

		touch $my_tmp

		#leitura do ficheiro cursos.txt

		while IFS=: read -r  ler_id_one ler_uni_one ler_curso_one ler_disciplina_um_one ler_disciplina_dois_one ler_disciplina_tres_one ler_disciplina_quatro_one ler_disciplina_cinco_one
		do
		
			#se o nome da universidade a eliminar e o nome da universidade lido forem iguais

			if [[ $ler_uni_one = $uni_name ]]
			then

				#leitura do ficheiro disciplinas.txt

				while IFS=: read -r  ler_id_tres ler_nome_tres ler_curso_tres ler_inscritos_tres
				do

					#caso o id da universidade corresponda id introduzido, nada acontece
					if [ $ler_curso_tres = $ler_curso_one ]
					then
						let descartavel++

					#caso contrário, escreve-se o conteúdo de disciplinas no ficheiro tmp.txt 

					else
						echo -e "$ler_id_tres:$ler_nome_tres:$ler_curso_tres:$ler_inscritos_tres" >> $my_tmp_dois
					fi		
				done < $disciplinas

				#move-se o conteúdo do tmp.txt para o disciplinas.txt

				mv $my_tmp_dois $disciplinas	
				touch $my_tmp_dois

			#se não forem iguais, nada acontece

			else
				let descartavel++			
			fi			
		done < $cursos	
				
		#leitura do ficheiro cursos.txt

		while IFS=: read -r  ler_id_five ler_uni_five ler_curso_five ler_disciplina_um_five ler_disciplina_dois_five ler_disciplina_tres_five ler_disciplina_quatro_five ler_disciplina_cinco_five
		do
		
			#caso o nome da universidae e o nome lido sejam iguais, nada acontece

			if [[ $ler_uni_five = $uni_name ]]
			then
				let descartavel++

			#caso não sejam iguais, escreve-se o conteúdo dos cursos no ficheiro tmp.txt		

			else
				echo -e "$ler_id_five:$ler_uni_five:$ler_curso_five:$ler_disciplina_um_five:$ler_disciplina_dois_five:$ler_disciplina_tres_five:$ler_disciplina_quatro_five:$ler_disciplina_cinco_five" >> $my_tmp
			fi
		done <$cursos

		#move-se o conteúdo do ficheiro tmp.txt para o ficheiro cursos.txt

		mv $my_tmp $cursos
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

			if [[ $ler_uni_seven = $uni_name ]]
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
		echo -e "\e[32mUniversidade apagada com sucesso\e[39m"
	fi
}
