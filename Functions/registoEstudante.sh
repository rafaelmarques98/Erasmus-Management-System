#!/bin/bash
#registoEstudante.sh

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

function _registoEstudante()
{
	echo -e "Introduza o nome do estudante (use o underscore (_) no lugar do espaço)"
	read estudante_nome
	echo -e "Introduza a universidade em que estuda o estudante"
	read estudante_uni
	echo -e "Introduza o curso em que se inscreve o estudante"
	read estudante_curso

	let confirmar=0

	#leitura do ficheiro cursos.txt

	while IFS=: read -r  ler_id ler_uni ler_nome ler_um ler_dois ler_tres ler_quatro ler_cinco
	do

		#caso a universidade introduzida seja válida, incrementa-se a variável confirmar

		if [ $ler_uni = $estudante_uni ]
		then
			let confirmar++
		fi
	done < $cursos
	
	#caso a variável confirmar não tenha sido incrementada
	
	if [ $confirmar -eq 0 ]
 	then
		echo -e "\e[91mUniversidade inválida, o professor não foi adicionado\e[39m"

	#caso a variável confirmar tenha sido incrementada

	else

		let confirmar_dois=0

		#leitura do ficheiro cursos.txt

		while IFS=: read -r  ler_id_tres ler_uni_tres ler_nome_tres ler_um_tres ler_dois_tres ler_tres_tres ler_quatro_tres ler_cinco_tres
		do

			#caso o curso introduzido seja válido, a variável confirmar_dois é incrementada

			if [ $ler_nome_tres = $estudante_curso ]
			then
				let confirmar_dois++
			fi
		done < $cursos	

		#caso a variável confirmar_dois não tenha sido incrementada

		if [ $confirmar_dois -eq 0 ]
		then
			echo -e "\e[91mCurso inválido, o professor não foi adicionado\e[39m"

		#caso a variável confirmar_dois tenha sido incrementada

		else

			#leitura do ficheiro disciplinas.txt
		
			while IFS=: read -r  ler_id_dois ler_nome_dois ler_curso_dois ler_inscritos_dois
			do

				#caso o curso da disciplina corresponda ao curso introduzido, incrementa-se o número de inscritos
				#e escrevem-se os dados da disciplina previamente existentes (mas com os inscritos incrementados)
				#no ficheiro tmp.txt 

				if [ $ler_curso_dois = $estudante_curso ]
				then
					let new_inscritos=$ler_inscritos_dois
					let new_inscritos++
					echo -e "$ler_id_dois:$ler_nome_dois:$ler_curso_dois:$new_inscritos" >> $my_tmp

				#caso o curso da disciplina não corresponda ao curso introduzido
				#escrevem-se os dados da disciplina previamente existentes (sem alterações)
				#no ficheiro tmp.txt

				else
					echo -e "$ler_id_dois:$ler_nome_dois:$ler_curso_dois:$ler_inscritos_dois" >> $my_tmp
				fi		
			done < $disciplinas
			
			#move-se o conteúdo do ficheiro tmp.txt para o ficheiro disciplinas.txt, sobrepondo-se a todo o conteúdo deste

			mv $my_tmp $disciplinas
			touch $my_tmp
			
			#obtenção da primeira coluna da última linha do ficheiro estudantes.txt, ou seja, o ultimo id registado
	
			student_id=$(tail -1 $estudantes | cut -d : -f 1)

			#incrementa-se o id

			let student_id++

			#escreve-se os dados relativos ao estudantes a registar no ficheiro estudantes.txt

			echo -e "$student_id:$estudante_nome:$estudante_uni:$estudante_curso" >> $estudantes

			echo ""
			echo -e "\e[32mEstudante adicionado com sucesso\e[39m"
			

		fi		

	fi

	
	#organiza o ficheiro estudantes.txt por ordem crescente de id
	sort -n $estudantes > $my_tmp
	mv $my_tmp $estudantes
	touch $my_tmp

	#organiza o ficheiro disciplinas.txt por ordem crescente de id
	sort -n $disciplinas > $my_tmp
	mv $my_tmp $disciplinas
	touch $my_tmp
}
