#!/bin/bash
#alterarProfessores.sh

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

function _alterarProfessores()
{
	echo -e "\e[93mAlterar dados de professores"

	echo -e "	\e[39m"

	echo -e "   \e[96m 1\e[39m- Nome do professor"

	echo -e "   \e[96m 2\e[39m- Universidade em que lecciona"


	echo -e "   \e[96m 3\e[39m- Curso em que lecciona"

	echo -e "   \e[96m 4\e[39m- Disciplina que lecciona"

	echo -e "	"

	echo -e "   \e[96m 0\e[39m- Sair para o menu principal"

	echo -e "	"

	echo -e "	Introduza a opção>"

	read opcao_alterar_professores

	#case para alterar dados dos professores

	case $opcao_alterar_professores in

	1)
	echo -e "Introduza o id do professor cujo nome deseja alterar (lembre-se de usar underscore (_) no lugar dos espaços)"
	read teacher_id

	echo -e "Introduza o novo nome (use o underscore (_) no lugar do espaço)"
	read new_teacher_name

	#Leitura do ficheiro professores.txt	

	while IFS=: read -r  ler_id ler_nome ler_universidade ler_curso ler_disciplina
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

		#obtém o antigo nome do professor

		old_teacher_name=$(grep "$teacher_id" $professores | cut -d : -f 2)

		#a partir do id do professor, troca o antigo nome pelo novo

		(grep $teacher_id $professores |sed -i 's/'$old_teacher_name'/'$new_teacher_name'/g' $professores)

		echo ""
		echo -e "\e[32mNome alterado com sucesso\e[39m"
	fi


	;;

	2)
	echo -e "Introduza o id do professor cuja universidade deseja alterar"
	read teacher_id

	echo -e "Introduza a nova universidade (use o underscore (_) no lugar do espaço)"
	read new_teacher_uni

	#Leitura do ficheiro professores.txt

	while IFS=: read -r  ler_id ler_nome ler_universidade ler_curso ler_disciplina
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
		let confirmar_dois=0

		#leitura do ficheiro universidades.txt

		while IFS=: read -r  ler_id ler_nome ler_localizacao
		do
			#caso o id introduzido seja válido, incrementa-se a variável confirmar

			if [ $ler_nome = $new_teacher_uni ]
			then
				let confirmar_dois++
			fi
		done < $universidades
	
		#caso a variável confirmar_dois não tenha sido incrementada

		if [ $confirmar_dois -eq 0 ]
	 	then
			echo -e "\e[91mNova universidade inválida, operação interrompida\e[39m"
		
		#caso a variável confirmar_dois tenha sido incrementada

		else		

			#obtém a antiga universidade

			old_teacher_uni=$(grep "$teacher_id" $professores | cut -d : -f 3)

			#a partir do id do professor, troca a antiga universidade pela nova

			(grep $teacher_id $professores |sed -i 's/'$old_teacher_uni'/'$new_teacher_uni'/g' $professores)

			echo ""
			echo -e "\e[32mUniversidade alterada com sucesso\e[39m"
		fi	
	fi
	;;

	3)
	echo -e "Introduza o id do professor cujo curso deseja alterar"
	read teacher_id

	echo -e "Introduza o novo curso (use o underscore (_) no lugar do espaço)"
	read new_teacher_curso

	echo -e "Introduza a nova disciplina (use o underscore (_) no lugar do espaço)"
	read nova_disciplina

	#Leitura do ficheiro professores.txt

	while IFS=: read -r  ler_id ler_nome ler_universidade ler_curso ler_disciplina
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
		let confirmar_dois=0
		let confirmar_tres=0
		#Leitura do ficheiro cursos.txt
	
		while IFS=: read -r  ler_id ler_uni ler_nome ler_disciplina_um ler_disciplina_dois ler_disciplina_tres ler_disciplina_quatro ler_disciplina_cinco
		do
			#caso o id introduzido seja válido, incrementa-se a variável confirmar

			if [ $ler_nome = $new_teacher_curso ]
			then
				let confirmar_dois++
				#Caso pelo menos uma das disciplinas desse curso seja a futura disciplina leccionada pelo professor

				if [ $ler_disciplina_um = $nova_disciplina ] || [ $ler_disciplina_dois = $nova_disciplina ] || [ $ler_disciplina_tres = $nova_disciplina ] || [ $ler_disciplina_quatro = $nova_disciplina ] || [ $ler_disciplina_cinco = $nova_disciplina ]
				then
					let confirmar_tres++
				fi
			fi
		done < $cursos
	
		#caso a variável confirmar_dois não tenha sido incrementada

		if [ $confirmar_dois -eq 0 ]
	 	then
			echo -e "\e[91mNovo curso inválido, operação interrompida\e[39m"
		
		#caso a variável confirmar_dois tenha sido incrementada

		else		

		#Caso a variável confirmar_tres não tenha sido incrementada	

			if [ $confirmar_tres -eq 0 ]
	 		then
				echo -e "\e[91mO disciplina nova não se encontra na base de dados\e[39m"
		
			#caso a variável confirmar_tres tenha sido incrementada

			else			
				#obtém a antiga disciplina
	
				old_teacher_disciplina=$(grep "$teacher_id" $professores | cut -d : -f 5)
	
				#a partir do id do professor, troca a antiga disciplina pela nova
	
				(grep $teacher_id $professores |sed -i 's/'$old_teacher_disciplina'/'$nova_disciplina'/g' $professores)

				echo ""

				#obtém o antigo curso

				old_teacher_curso=$(grep "$teacher_id" $professores | cut -d : -f 4)

				#a partir do id do professor, troca o antigo curso pelo novo

				(grep $teacher_id $professores |sed -i 's/'$old_teacher_curso'/'$new_teacher_curso'/g' $professores)

				echo ""
				echo -e "\e[32mCurso alterado com sucesso\e[39m"
			fi
		fi		
	fi
	;;

	4)
	echo -e "Introduza o id do professor cuja disciplina leccionada deseja alterar"
	read teacher_id

	echo -e "Introduza a nova disciplina (use o underscore (_) no lugar do espaço)"
	read nova_disciplina

	let confirmar=0

	#Leitura do ficheiro professores.txt

	while IFS=: read -r  ler_id ler_nome ler_universidade ler_curso ler_disciplina
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

		#Obtenção do curso a que o professor pertence
	
		teacher_curso=$(grep "$teacher_id" $professores | cut -d : -f 4)
		let confirmar_dois=0
		let confirmar_tres=0

		#leitura do ficheiro cursos.txt

		while IFS=: read -r  ler_id ler_uni ler_nome ler_disciplina_um ler_disciplina_dois ler_disciplina_tres ler_disciplina_quatro ler_disciplina_cinco
		do
			#caso o curso lido seja igual ao curso do professor
			
			if [ $ler_nome = $teacher_curso ]
			then
				let confirmar_dois++
				#Caso pelo menos uma das disciplinas desse curso seja a futura disciplina leccionada pelo professor

				if [ $ler_disciplina_um = $nova_disciplina ] || [ $ler_disciplina_dois = $nova_disciplina ] || [ $ler_disciplina_tres = $nova_disciplina ] || [ $ler_disciplina_quatro = $nova_disciplina ] || [ $ler_disciplina_cinco = $nova_disciplina ]
				then
					let confirmar_tres++
				fi
			fi
		done < $cursos
	
		#caso a variável confirmar_dois não tenha sido incrementada

		if [ $confirmar_dois -eq 0 ]
	 	then
			echo -e "\e[91mO curso que o professor lecciona não se encontra na base de dados\e[39m"
		
		#caso a variável confirmar_dois tenha sido incrementada

		else	

			#Caso a variável confirmar_tres não tenha sido incrementada	

			if [ $confirmar_tres -eq 0 ]
	 		then
				echo -e "\e[91mO disciplina nova não se encontra na base de dados\e[39m"
		
			#caso a variável confirmar_tres tenha sido incrementada

			else			
				#obtém a antiga disciplina
	
				old_teacher_disciplina=$(grep "$teacher_id" $professores | cut -d : -f 5)
	
				#a partir do id do professor, troca a antiga disciplina pela nova
	
				(grep $teacher_id $professores |sed -i 's/'$old_teacher_disciplina'/'$nova_disciplina'/g' $professores)

				echo ""
				echo -e "\e[32mDisciplina alterada com sucesso\e[39m"
			fi
		fi	
	fi
	;;

	0)
	echo -e "Retornando ao menu principal..."
	echo -e " "
	;;

	*)
	echo -e "\e[91mOpção inválida\e[39m"
	echo -e ""
	;;

	#fim do case para alterar dados de professores

	esac
}
