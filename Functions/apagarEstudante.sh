#!/bin/bash
#apagarEstudante.sh

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

function _apagarEstudante()
{
	
	echo -e "\e[93mApagar dados de estudantes"

	echo -e "	\e[39m"

	echo -e "	"

	echo -e "Introduza o id do estudante que deseja apagar (lembre-se de usar underscore (_) no lugar dos espaços)"
	read student_id
	let confirmar=0

	#Leitura do ficheiro estudantes.txt

	while IFS=: read -r  ler_id ler_nome ler_uni ler_curso
	do
		#caso o id introduzido seja válido, incrementa-se a variável confirmar

		if [ $ler_id = $student_id ]
		then
			let confirmar++
		fi
	done < $estudantes
	
	#caso a variável confirmar não tenha sido incrementada

	if [ $confirmar -eq 0 ]
 	then
		echo -e "\e[91mEstudante inválido, operação interrompida\e[39m"
	
	#caso a variável confirmar tenha sido incrementada

	else
	
		student_curso=$(grep "$student_id" $estudantes | cut -d : -f 4)

		#Leitura do ficheiro estudantes.txt

		while IFS=: read -r  ler_id ler_nome ler_uni ler_curso
			do

				#caso o id do estudante corresponda id introduzido, nada acontece
				if [ $ler_id = $student_id ]
				then
					let descartavel++

				#caso não correspondam, escreve-se o conteúdo dos estudantes no ficheiro tmp.txt

				else
					echo -e "$ler_id:$ler_nome:$ler_uni:$ler_curso" >> $my_tmp
				fi		
			done < $estudantes

		#Move-se o conteúdo do ficheiro tmp.txt para o ficheiro estudantes.txt

		mv $my_tmp $estudantes
		touch $my_tmp
	
		#Obtenção do curso do estudante através do id


		#Leitura do ficheiro disciplinas.txt

		while IFS=: read -r  ler_id_dois ler_nome_dois ler_curso_dois ler_inscritos_dois
			do

				#Caso o curso do estudante e o curso lido correspondam, decrementam-se o número inscritos e escreve-se o conteúdo com o novo número de inscritos no ficheiro tmp.txt

				if [ $ler_curso_dois = $student_curso ]
				then
					let new_inscritos=$ler_inscritos_dois
					let new_inscritos--
					echo -e "$ler_id_dois:$ler_nome_dois:$ler_curso_dois:$new_inscritos" >> $my_tmp

				#caso não correspondam escreve-se o conteúdo original

				else
					echo -e "$ler_id_dois:$ler_nome_dois:$ler_curso_dois:$ler_inscritos_dois" >> $my_tmp
				fi		
		done < $disciplinas

		#Move-se o conteúdo do ficheiro tmp.txt para o ficheiro disciplinas.txt

		mv $my_tmp $disciplinas	
		touch $my_tmp

		echo ""
		echo -e "\e[32mEstudante apagada com sucesso\e[39m"			

	fi
}
