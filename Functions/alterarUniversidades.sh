#!/bin/bash
#alterarUniversidades.sh

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

function _alterarUniversidades()
{
	echo -e "\e[93mAlterar dados de universidades\e[39m"

	echo -e "   "

	echo -e "   \e[96m 1\e[39m- Nome da universidade"

	echo -e "   \e[96m 2\e[39m- Localização da universidade"

	echo -e "	"

	echo -e "   \e[96m 0\e[39m- Sair para o menu principal"

	echo -e "	"

	echo -e "	Introduza a opção>"

	read opcao_alterar_universidades

	#case para alterar dados da universidades

	case $opcao_alterar_universidades in

	1)
	echo -e "Introduza o id da universidade cujo nome deseja alterar (lembre-se de usar underscore (_) no lugar dos espaços)"
	read university_id

	echo -e "Introduza o novo nome (use o underscore (_) no lugar do espaço)"
	read new_university_name

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

		#obtém o nome antigo da universidade

		old_university_name=$(grep "$university_id" $universidades | cut -d : -f 2)

		#a partir do id da universidade, troca o antigo nome pelo novo nome

		(grep $university_id $universidades |sed -i 's/'$old_university_name'/'$new_university_name'/g' $universidades)

		#a partir do antigo nome da universidade, troca o antigo nome pelo novo no ficheiro cursos.txt

		(grep $old_university_name $cursos |sed -i 's/'$old_university_name'/'$new_university_name'/g' $cursos)

		#a partir do antigo nome da universidade, troca o antigo nome pelo novo no ficheiro estudantes.txt	

		(grep $old_university_name $estudantes |sed -i 's/'$old_university_name'/'$new_university_name'/g' $estudantes)	

		#a partir do antigo nome da universidade, troca o antigo nome pelo novo no ficheiro professores.txt	

		(grep $old_university_name $professores |sed -i 's/'$old_university_name'/'$new_university_name'/g' $professores)

		echo ""
		echo -e "\e[32mNome alterado com sucesso\e[39m"			

		
		echo ""
		echo -e "\e[32mNome alterado com sucesso\e[39m"

	fi

	;;

	2)
	echo -e "Introduza o id da universidade cuja localização deseja alterar (lembre-se de usar underscore (_) no lugar dos espaços)"
	read university_id

	echo -e "Introduza a nova localização (use o underscore (_) no lugar do espaço)"
	read new_university_local

	

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

		#obtém a antiga localização da universidade

		old_university_local=$(grep "$university_id" $universidades | cut -d : -f 3)

		#a partir do id da universidade, troca a antiga localização pela nova

		(grep $university_id $universidades |sed -i 's/'$old_university_local'/'$new_university_local'/g' $universidades)

		echo ""
		echo -e "\e[32mLocalização alterada com sucesso\e[39m"
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

	#fim do case para alterar dados de universidades

	esac
}
