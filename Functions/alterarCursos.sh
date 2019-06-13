#!/bin/bash
#alterarCursos.sh

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

function _alterarCursos()
{
	echo -e "\e[93mAlterar dados de curso"

	echo -e "	\e[39m"

	echo -e "\e[96m 1\e[39m- Nome do curso"

	echo -e "	"

	echo -e "\e[96m 0\e[39m- Sair para o menu principal"

	echo -e "	"

	echo -e "	Introduza a opção>"

	read opcao_alterar_curso

	#case para alterar dados dos crusos

	case $opcao_alterar_curso in

	1)
	echo -e "Introduza o id do curso cujo nome deseja alterar (lembre-se de usar underscore (_) no lugar dos espaços)"
	read curso_id

	echo -e "Introduza o novo nome (use o underscore (_) no lugar do espaço)"
	read new_curso_name
	
	#Leitura do ficheiro cursos.txt

	while IFS=: read -r  ler_id ler_uni ler_nome ler_disciplina_um ler_disciplina_dois ler_disciplina_tres ler_disciplina_quatro ler_disciplina_cinco
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

		#obtém o antigo nome do curso

		old_curso_name=$(grep "$curso_id" $cursos | cut -d : -f 3)

		#a partir do id do curso, troca o antigo nome pelo novo

		(grep $curso_id $cursos |sed -i 's/'$old_curso_name'/'$new_curso_name'/g' $cursos)

		#a partir do antigo nome do curso, troca o antigo nome pelo novo no ficheiro disciplinas.txt	

		(grep $old_curso_name $disciplinas |sed -i 's/'$old_curso_name'/'$new_curso_name'/g' $disciplinas)

		#a partir do antigo nome do curso, troca o antigo nome pelo novo no ficheiro estudantes.txt	

		(grep $old_curso_name $estudantes |sed -i 's/'$old_curso_name'/'$new_curso_name'/g' $estudantes)	

		#a partir do antigo nome do curso, troca o antigo nome pelo novo no ficheiro professores.txt	

		(grep $old_curso_name $professores |sed -i 's/'$old_curso_name'/'$new_curso_name'/g' $professores)

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

	#fim do case para alterar dados de cursos

	esac
}

