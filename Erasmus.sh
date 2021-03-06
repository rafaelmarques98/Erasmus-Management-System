#!/bin/bash
#Erasmus.sh

universidades="Dados/universidades.txt"
professores="Dados/professores.txt"
estudantes="Dados/estudantes.txt"
disciplinas="Dados/disciplinas.txt"
cursos="Dados/cursos.txt"
universidades_backup="Backup/universidades.bak"
professores_backup="Backup/professores.bak"
estudantes_backup="Backup/estudantes.bak"
disciplinas_backup="Backup/disciplinas.bak"
cursos_backup="Backup/cursos.bak"
my_tmp="Dados/tmp.txt"
my_tmp_dois="Dados/tmp_dois.txt"
let descartavel=0;

#Algumas cores usadas#

# cyan="\e[96m"
# default="\e[39m"
# yellow="\e[93m"
# red="\e[91m"
#magenta= "\e[95m"
#green= "\e[32m"

source Functions/./verificarDados.sh
_verificarDados

#ciclo que garante que o programa só acaba quando a opção "Sair do programa" for escolhida
while [ true ]; do
	source Functions/./menus.sh
	_menuPrincipal
	read opcao_principal;

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    
#case das escolhas disponíveis no menu principal
    case $opcao_principal in

        1) 
	source Functions/./menus.sh
	_menuRegisto
	read opcao_registo;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
#case das escolhas disponiveis no menu registo

	case $opcao_registo in
	1)
	source Functions/./registoUniversidade.sh
	_registoUniversidade
	;;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	2)
	source Functions/./registoProfessor.sh
	_registoProfessor
	;;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	3)
	source Functions/./registoEstudante.sh
	_registoEstudante
	;;


#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	4)
	source Functions/./registoCurso.sh
	_registoCurso
	;;	


#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	0)
	echo -e "Retornando ao menu principal..."
	echo -e " "
	;;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	*)
	echo -e "\e[91mOpção inválida\e[39m"
	;;
	
	#fim do case para o registo	
	esac
	;;

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
	
        2)
	source Functions/./menus.sh
	_menuAlterar
	read opcao_alterar

	#case para alterar dados

	case $opcao_alterar in

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	1)
	source Functions/./alterarUniversidades.sh
	_alterarUniversidades
	;;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	2)
	source Functions/./alterarProfessores.sh
	_alterarProfessores
	;;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	3)
	source Functions/./alterarEstudantes.sh
	_alterarEstudantes
	;;


#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	4)
	source Functions/./alterarDisciplinas.sh
	_alterarDisciplinas
	;;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	5)
	source Functions/./alterarCursos.sh
	_alterarCursos
	;;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	0)
	echo -e "Retornando ao menu principal..."
	echo -e " "
	;;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	*)
	echo -e "\e[91mOpção inválida\e[39m"
	echo -e ""
	;;

	#fim do case para alterar dados

	esac
	;;

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
	
	3)
	source Functions/./menus.sh
	_menuApagar
	read opcao_apagar

	#case para apagar dados

	case $opcao_apagar in

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	1)
	source Functions/./apagarUniversidade.sh
	_apagarUniversidade
	;;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	2)
	source Functions/./apagarProfessor.sh
	_apagarProfessor
	;;

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	3)
	source Functions/./apagarEstudante.sh
	_apagarEstudante
	;;

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	4)
	source Functions/./apagarCurso.sh
	_apagarCurso	
	;;

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	0)
		echo -e "Retornando ao menu principal"
		echo -e ""
	;;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	*)
		echo -e "Opção inválida"
		echo -e ""
	;;
	esac
	;;

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
	
        4)
	source Functions/./menus.sh
	_menuVisualizar
	read opcao_relatorios

	#case para relatorios

	case $opcao_relatorios in

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	1)
	source Functions/./visualizar.sh
	_visualizarUniversidades
	;;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	2)
	source Functions/./visualizar.sh
	_visualizarDisciplinas
	;;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	3)
	source Functions/./visualizar.sh
	_visualizarAlunos
	;;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	4)
	source Functions/./visualizar.sh
	_visualizarDisciplinasInscritos
	;;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	5)
	source Functions/./visualizar.sh
	_visualizarProfessores
	;;
	
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	6)
	source Functions/./visualizar.sh
	_visualizarCursos
	;;
	
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	0)
	echo -e "Retornando ao menu principal..."
	echo -e " "
	;;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	*)
	echo -e "\e[91mOpção inválida\e[39m"
	echo -e ""
	;;

	#fim do case para relatorios

	esac
	;;

#||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

        5)
	source Functions/./menus.sh
	_menuBaseDados
	read opcao_dados

	#case para gestao de base de dados

	case $opcao_dados in

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	1)
	source Functions/./baseDados.sh
	_criarBackup
	;;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	2)
	source Functions/./baseDados.sh
	_restaurarBackup
	;;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	3)
	source Functions/./baseDados.sh
	_eliminarBackup
	;;
	
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	0)
	echo -e "Retornando ao menu principal..."
	echo -e " "
	;;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	*)
	echo -e "\e[91mOpção inválida\e[39m"
	echo -e ""
	;;

	#fim do case para gestao de base de dados

	esac
	;;

#||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

        0)	
		exit
	;;

#||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

	*)
	echo -e "\e[91mOpção inválida\e[39m"
	;;

    esac 
 done



