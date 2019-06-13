#!/bin/bash
#alterarEstudantes.sh

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

function _alterarEstudantes()
{
	echo -e "\e[93mAlterar dados de estudantes"

	echo -e "	\e[39m"

	echo -e "   \e[96m 1\e[39m- Nome do estudante"

	echo -e "   \e[96m 2\e[39m- Curso Frequentado pelo estudante"

	echo -e "   \e[96m 3\e[39m- Universidade Frequentada Pelo estudante"

	echo -e "	"

	echo -e "   \e[96m 0\e[39m- Sair para o menu principal"

	echo -e "	"

	echo -e "	Introduza a opção>"

	read opcao_alterar_estudantes

	#case para alterar dados dos estudantes

	case $opcao_alterar_estudantes in

	1)
	echo -e "Introduza o id do estudante cujo nome deseja alterar (lembre-se de usar underscore (_) no lugar dos espaços)"
	read student_id

	echo -e "Introduza o novo nome (use o underscore (_) no lugar do espaço)"
	read new_student_name

	#Leitura do ficheiro estudantes.txt

	while IFS=: read -r  ler_id ler_nome ler_universidade ler_curso
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

		#obtém o antigo nome do estudante

		old_student_name=$(grep "$student_id" $estudantes | cut -d : -f 2)

		#a partir do id do estudante, troca o antigo nome pelo novo

		(grep $student_id $estudantes |sed -i 's/'$old_student_name'/'$new_student_name'/g' $estudantes)

		echo ""
		echo -e "\e[32mNome alterado com sucesso\e[39m"
	fi
	;;

	2)
	echo -e "Introduza o id do estudante cujo curso frequentado deseja alterar (lembre-se de usar underscore (_) no lugar dos espaços)"
	read student_id

	echo -e "Introduza o novo curso (use o underscore (_) no lugar do espaço)"
	read new_student_curso

	#Leitura do ficheiros estudantes.txt	

	while IFS=: read -r  ler_id ler_nome ler_universidade ler_curso
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
		let confirmar_dois=0

		#Leitura do ficheiro cursos.txt

		while IFS=: read -r  ler_id ler_uni ler_nome ler_disciplina_um ler_disciplina_dois ler_disciplina_tres ler_disciplina_quatro ler_disciplina_cinco
		do
			#caso o novo curso exista na base de dados, a variável confirmar_dois é incrementada

			if [ $ler_nome = $new_student_curso ]
			then
				let confirmar_dois++
			fi
		done < $cursos
	
		#caso a variável confirmar_dois não tenha sido incrementada

		if [ $confirmar_dois -eq 0 ]
	 	then
			echo -e "\e[91mNovo curso inválido, operação interrompida\e[39m"
		
		#caso a variável confirmar_dois tenha sido incrementada

		else		

			#Obtenção do antigo curso do estudante

			old_student_curso=$(grep "$student_id" $estudantes | cut -d : -f 4)

			#Leitura do ficheiro disciplinas.txt

			while IFS=: read -r  ler_id_dois ler_nome_dois ler_curso_dois ler_inscritos_dois
			do

				#caso o curso da disciplina corresponda ao antigo curso, decrementa-se o número de inscritos
				#e escrevem-se os dados da disciplina previamente existentes (mas com os inscritos decrementados)
				#no ficheiro tmp.txt 

				if [ $ler_curso_dois = $old_student_curso ]
				then
					let new_inscritos=$ler_inscritos_dois
					let new_inscritos--
					echo -e "$ler_id_dois:$ler_nome_dois:$ler_curso_dois:$new_inscritos" >> $my_tmp

				#caso o curso da disciplina não corresponda ao curso introduzido
				#escrevem-se os dados da disciplina previamente existentes (sem alterações)
				#no ficheiro tmp.txt

				else
					echo -e "$ler_id_dois:$ler_nome_dois:$ler_curso_dois:$ler_inscritos_dois" >> $my_tmp
				fi		
			done < $disciplinas

			mv $my_tmp $disciplinas		
			touch $my_tmp

			while IFS=: read -r  ler_id_tres ler_nome_tres ler_curso_tres ler_inscritos_tres
			do

				#caso o curso da disciplina corresponda ao curso introduzido, incrementa-se o número de inscritos
				#e escrevem-se os dados da disciplina previamente existentes (mas com os inscritos incrementados)
				#no ficheiro tmp.txt 

				if [ $ler_curso_tres = $new_student_curso ]
				then
					let new_inscritos_dois=$ler_inscritos_tres
					let new_inscritos_dois++
					echo -e "$ler_id_tres:$ler_nome_tres:$ler_curso_tres:$new_inscritos_dois" >> $my_tmp

				#caso o curso da disciplina não corresponda ao curso introduzido
				#escrevem-se os dados da disciplina previamente existentes (sem alterações)
				#no ficheiro tmp.txt

				else
					echo -e "$ler_id_tres:$ler_nome_tres:$ler_curso_tres:$ler_inscritos_tres" >> $my_tmp
				fi		
			done < $disciplinas
			
			#move-se o conteúdo do ficheiro tmp.txt para o ficheiro disciplinas.txt, sobrepondo-se a todo o conteúdo deste

			mv $my_tmp $disciplinas		
			touch $my_tmp	

			#a partir do id do estudante, troca o antigo curso pelo novo

			(grep $student_id $estudantes |sed -i 's/'$old_student_curso'/'$new_student_curso'/g' $estudantes)

			echo ""
			echo -e "\e[32mCurso alterado com sucesso\e[39m"
		fi	
	fi
	;;

	3)
	echo -e "Introduza o id do estudante cuja universidade deseja alterar (lembre-se de usar underscore (_) no lugar dos espaços)"
	read student_id

	echo -e "Introduza a nova universidade (use o underscore (_) no lugar do espaço)"
	read new_student_uni

	#Leitura do ficheiro estudantes.txt

	while IFS=: read -r  ler_id_student ler_nome_student ler_universidade_student ler_curso_student
	do
		#caso o id introduzido seja válido, incrementa-se a variável confirmar

		if [ $ler_id_student = $student_id ]
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
		let confirmar_dois=0

		#Leitura do ficheiro universidades.txt

		while IFS=: read -r  ler_id_uni ler_nome_uni ler_localizacao_uni
		do
			#caso a nova universidade exista na base de dados

			if [ $ler_nome_uni = $new_student_uni ]
			then
				let confirmar_dois++
			fi
		done < $universidades

		#Caso a variável confirmar_dois não tenha sido incrementada	

		if [ $confirmar_dois -eq 0 ]
 		then
			echo -e "\e[91mUniversidade inválida, operação interrompida\e[39m"
	
		#caso a variável confirmar_dois tenha sido incrementada

		else		

			#Obtenção do antigo curso do estudante

			old_student_curso=$(grep "$student_id" $estudantes | cut -d : -f 4)

			#Leitura do ficheiro disciplinas.txt 

			while IFS=: read -r  ler_id_dois ler_nome_dois ler_curso_dois ler_inscritos_dois
			do

				#caso o curso da disciplina corresponda ao curso introduzido, incrementa-se o número de inscritos
				#e escrevem-se os dados da disciplina previamente existentes (mas com os inscritos incrementados)
				#no ficheiro tmp.txt 

				if [ $ler_curso_dois = $old_student_curso ]
				then
					let new_inscritos=$ler_inscritos_dois
					let new_inscritos--
					echo -e "$ler_id_dois:$ler_nome_dois:$ler_curso_dois:$new_inscritos" >> $my_tmp

				#caso o curso da disciplina não corresponda ao curso introduzido
				#escrevem-se os dados da disciplina previamente existentes (sem alterações)
				#no ficheiro tmp.txt

				else
					echo -e "$ler_id_dois:$ler_nome_dois:$ler_curso_dois:$ler_inscritos_dois" >> $my_tmp
				fi		
			done < $disciplinas
			
			#Move-se o contúdo do ficheiro tmp.txt para o ficheiro disciplinas.txt
			mv $my_tmp $disciplinas		
			touch $my_tmp

			#Obtenção do antigo curso do estudante

			old_student_uni=$(grep "$student_id" $estudantes | cut -d : -f 3)

			echo -e "Introduza o novo curso"
			read new_student_curso
			
			while IFS=: read -r  ler_id_tres ler_nome_tres ler_curso_tres ler_inscritos_tres
			do

				#caso o curso da disciplina corresponda ao curso introduzido, incrementa-se o número de inscritos
				#e escrevem-se os dados da disciplina previamente existentes (mas com os inscritos incrementados)
				#no ficheiro tmp.txt 

				if [ $ler_curso_tres = $new_student_curso ]
				then
					let new_inscritos_dois=$ler_inscritos_tres
					let new_inscritos_dois++
					echo -e "$ler_id_tres:$ler_nome_tres:$ler_curso_tres:$new_inscritos_dois" >> $my_tmp

				#caso o curso da disciplina não corresponda ao curso introduzido
				#escrevem-se os dados da disciplina previamente existentes (sem alterações)
				#no ficheiro tmp.txt

				else
					echo -e "$ler_id_tres:$ler_nome_tres:$ler_curso_tres:$ler_inscritos_tres" >> $my_tmp
				fi		
			done < $disciplinas

			#a partir do id do estudante, troca a antiga universidade pela nova		

			(grep $student_id $estudantes |sed -i 's/'$old_student_uni'/'$new_student_uni'/g' $estudantes)
		
			#a partir do id do estudante, troca o antigo curso por "Sem_Curso"

			(grep $student_id $estudantes |sed -i 's/'$old_student_curso'/'$new_student_curso'/g' $estudantes)

			echo ""
			echo -e "\e[32mUniversidade alterada com sucesso\e[39m"		
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

	#fim do case para alterar dados de estudantes

	esac
}
