#!/bin/bash
#alterarDisciplinas.sh

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

function _alterarDisciplinas()
{
	echo -e "\e[93mAlterar dados de disciplinas"

	echo -e "	\e[39m"

	echo -e "\e[96m 1\e[39m- Nome da disciplina"

	echo -e "	"

	echo -e "\e[96m 0\e[39m- Sair para o menu principal"

	echo -e "	"

	echo -e "	Introduza a opção>"

	read opcao_alterar_disciplinas

	#case para alterar dados das disciplinas

	case $opcao_alterar_disciplinas in

	1)
	echo -e "Introduza o id da discipina cujo nome deseja alterar (lembre-se de usar underscore (_) no lugar dos espaços)"
	read subject_id

	echo -e "Introduza o novo nome (use o underscore (_) no lugar do espaço)"
	read new_subject_name
	
	#Leitura do ficheiro disciplinas.txt

	while IFS=: read -r  ler_id ler_nome ler_curso ler_inscritos
	do
		#caso o id introduzido seja válido, incrementa-se a variável confirmar

		if [ $ler_id = $subject_id ]
		then
			let confirmar++
		fi
	done < $disciplinas
	
	#caso a variável confirmar não tenha sido incrementada

	if [ $confirmar -eq 0 ]
 	then
		echo -e "\e[91mDisciplina inválida, operação interrompida\e[39m"
	
	#caso a variável confirmar tenha sido incrementada

	else

		while IFS=: read -r  ler_id old_subject_name ler_curso ler_inscritos
		do
		#caso o id introduzido seja válido, incrementa-se a variável confirmar

			if [ $ler_id = $subject_id ]
			then
				#a partir do id da disciplina, troca o antigo nome pelo novo

				(grep $subject_id $disciplinas | sed -i 's/'$old_subject_name'/'$new_subject_name'/g' $disciplinas)

				#a partir do antigo nome da dsiciplina, troca o antigo nome pelo novo no ficheiro professores

				(grep $old_subject_name $professores | sed -i 's/'$old_subject_name'/'$new_subject_name'/g' $professores)

				#a partir do curso da dsiciplina, troca o antigo nome pelo novo no ficheiro cursos

				(grep $old_subject_name $cursos | sed -i 's/'$old_subject_name'/'$new_subject_name'/g' $cursos)
			fi
		done < $disciplinas
		echo ""
		echo -e "\e[32mNome alterado com sucesso\e[39m"
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

	#fim do case para alterar dados de disciplinas

	esac
}
