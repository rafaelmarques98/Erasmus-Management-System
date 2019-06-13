#!/bin/bash
#registoProfessor.sh

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

function _registoProfessor()
{
	echo -e "Introduza o nome do professor (use o underscore (_) no lugar do espaço)"
	read professor_nome
	echo -e "Introduza a universidade em que lecciona o professor"
	read professor_uni
	echo -e "Introduza o curso em que lecciona o professor"
	read professor_curso
	echo -e "Introduza a disciplina leccionada pelo professore (use o underscore (_) no lugar do espaço)"
	read professor_disciplinas

	let confirmar=0

	#leitura do ficheiro cursos.txt

	while IFS=: read -r  ler_id ler_uni ler_nome ler_disciplina_um ler_disciplina_dois ler_disciplina_tres ler_disciplina_quatro ler_disciplina_cinco
	do
		#caso a universidade introduzida seja válida, incrementa-se a variável confirmar

		if [ $ler_uni = $professor_uni ]
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
	
		while IFS=: read -r  ler_id_dois ler_uni_dois ler_nome_dois ler_disciplina_um_dois ler_disciplina_dois_dois ler_disciplina_tres_dois ler_disciplina_quatro_dois ler_disciplina_cinco_dois
		do

			#caso a o curso introduzido seja válido, incrementa-se a variável confirmar_dois

			if [ $ler_nome_dois = $professor_curso ]
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
			let confirmar_tres=0

			#leitura do ficheiro cursos.txt		
	
			while IFS=: read -r  ler_id_tres ler_uni_tres ler_nome_tres ler_disciplina_um_tres ler_disciplina_dois_tres ler_disciplina_tres_tres ler_disciplina_quatro_tres ler_disciplina_cinco_tres
			do
				
				#caso a disciplina que o professor lecciona seja uma das lidas, incrementa-se a variável confirmar_tres		

				if [ $ler_disciplina_um_tres = $professor_disciplinas ] || [ $ler_disciplina_dois_tres = $professor_disciplinas ] ||[ $ler_disciplina_tres_tres = $professor_disciplinas ] ||[ $ler_disciplina_quatro_tres = $professor_disciplinas ] ||[ $ler_disciplina_cinco_tres = $professor_disciplinas ]
				then
					let confirmar_tres++
				fi
			done < $cursos

			#caso a variável confirmar_tres não tenha sido incrementada		

			if [ $confirmar_tres -eq 0 ]
			then
				echo -e "\e[91mDisciplina inválida, o professor não foi adicionado\e[39m"

			#caso a variável confirmar_tres tenha sido incrementada

			else
				#obtenção da primeira coluna da última linha do ficheiro professores.txt, ou seja, o ultimo id registado
	
				professor_id=$(tail -1 $professores | cut -d : -f 1)

				#incrementa-se o id

				let professor_id++

				#escreve-se os dados relativos ao estudantes a registar no ficheiro professores.txt

				echo -e "$professor_id:$professor_nome:$professor_uni:$professor_curso:$professor_disciplinas" >> $professores
				
				echo ""
				echo -e "\e[32mProfessor adicionado com sucesso\e[39m"
			fi
		fi
	fi
	
	#organiza o ficheiro professores.txt por ordem crescente de id

	sort -n $professores > $my_tmp
	mv $my_tmp $professores
	touch $my_tmp		
}
