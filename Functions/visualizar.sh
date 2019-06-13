#!/bin/bash
#visualizar.sh

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

function _visualizarUniversidades()
{
	echo -e ""
	while IFS=: read -r  ler_id ler_nome ler_localizacao
	do
		echo -e "\e[95m Id da universidades: \e[39m $ler_id"
		echo -e "\e[95m Nome da universidades: \e[39m $ler_nome"
		echo -e "\e[95m Localização da universidades: \e[39m $ler_localizacao"
	done < $universidades
	echo -e ""
}

function _visualizarDisciplinas()
{
	echo -e ""
	while IFS=: read -r  ler_id ler_nome ler_curso ler_inscritos
	do
		echo -e "\e[95mId da disciplinas:\e[39m $ler_id"
		echo -e "\e[95mNome da disciplinas:\e[39m $ler_nome"
		echo -e "\e[95mCurso da disciplinas:\e[39m $ler_curso"
		echo -e "\e[95mNúmero de Inscritos:\e[39m $ler_inscritos"
	done < $disciplinas
	echo -e ""
}

function _visualizarAlunos()
{
	echo -e ""
	while IFS=: read -r  ler_id ler_nome ler_uni ler_curso
	do
		echo -e "\e[95mNúmero de Aluno:\e[39m $ler_id"
		echo -e "\e[95mNome do Aluno:\e[39m $ler_nome"
		echo -e "\e[95mUniversade que Frequenta:\e[39m $ler_uni"
		echo -e "\e[95mCurso que Frequenta:\e[39m $ler_curso"
	done < $estudantes
	echo -e ""
}

function _visualizarDisciplinasInscritos()
{
	while IFS=: read -r  ler_id ler_nome ler_curso ler_inscritos
	do
		if [ $ler_inscritos != 0 ]
		then
			echo -e "\e[95mId da disciplinas:\e[39m $ler_id"
			echo -e "\e[95mNome da disciplinas:\e[39m $ler_nome"
			echo -e "\e[95mCurso da disciplinas:\e[39m $ler_curso"
			echo -e "\e[95mNúmero de Inscritos:\e[39m $ler_inscritos"
		fi
	done < $disciplinas
	echo -e ""
}

function _visualizarProfessores()
{
	echo -e ""
	while IFS=: read -r  ler_id ler_nome ler_universidade ler_curso ler_disciplina
	do
		echo -e "\e[95mId do professores:\e[39m $ler_id"
		echo -e "\e[95mNome do professores:\e[39m $ler_nome"
		echo -e "\e[95mCurso do professores:\e[39m $ler_curso"
		echo -e "\e[95mDisciplina que lecciona:\e[39m $ler_disciplina"

	done < $professores
	echo -e ""
}

function _visualizarCursos()
{
	echo -e ""
	while IFS=: read -r  ler_id ler_universidade ler_nome ler_disciplina_um ler_disciplina_dois ler_disciplina_tres ler_disciplina_quatro ler_disciplina_cinco
	do
		echo -e "\e[95mId do curso:\e[39m $ler_id"
		echo -e "\e[95mNome do curso:\e[39m $ler_nome"
		echo -e "\e[95mUniversidade a que pertence o curso:\e[39m $ler_curso"
		echo -e "\e[95mDisciplinas pertencentes ao curso:\e[39m $ler_disciplina_um, $ler_disciplina_dois, $ler_disciplina_tres, $ler_disciplina_quatro, $ler_disciplina_cinco"
	done < $cursos
	echo -e ""
}

