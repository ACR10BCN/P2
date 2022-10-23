#!/bin/bash

# Be sure that this file has execution permissions:
# Use the nautilus explorer or chmod +x run_vad.sh

# Write here the name and path of your program and database
DIR_P2=$HOME/PAV/P2
DB=$DIR_P2/db.v4
CMD="$DIR_P2/bin/vad"

# Segona pregunta del ampliable, parametres accesibles desde la linea de comando
# He trobat un tuto a Youtube d'algu que ho feia aixi, no se si esta be pq em dona l'error de violacion del segmento
# Com no sabem quants arguments tindrem a la linea de comandos, fem un if amb diferent numero de parametres

# Saps pq salta aquest error??
# scripts/run_vad.sh: línea 18: error sintáctico cerca del elemento inesperado `}'
# Eren els {} del if que nose pq no l'hi agraden

if [ $# -eq 1 ]
  then
    CMD="$DIR_P2/bin/vad --alpha1=$1"
fi
if [ $# -eq 2 ]
  then
    CMD="$DIR_P2/bin/vad --alpha1=$1 --alpha2=$2"
fi
if [ $# -eq 3 ]
  then
    CMD="$DIR_P2/bin/vad --alpha1=$1 --alpha2=$2 --frame_duration=$3"
fi
if [ $# -eq 4 ]
  then
    CMD="$DIR_P2/bin/vad --alpha1=$1 --alpha2=$2 --frame_duration=$3 --max_maybe_silence=$4"
fi
if [ $# -eq 5 ]
  then
    CMD="$DIR_P2/bin/vad --alpha1=$1 --alpha2=$2 --frame_duration=$3 --max_maybe_silence=$4 --max_maybe_voice=$5"
fi
if [ $# -eq 6 ]
  then
    CMD="$DIR_P2/bin/vad --alpha1=$1 --alpha2=$2 --frame_duration=$3 --max_maybe_silence=$4 --max_maybe_voice=$5 --pinit=$6"
fi
if [ $# -eq 7 ]
  then
    CMD="$DIR_P2/bin/vad --alpha1=$1 --alpha2=$2 --frame_time_ms=$3 --max_st_maybe_silence=$4 --max_st_maybe_voice=$5 --pnumber_init=$6 --alpha1zero=$7"
fi
if [ $# -eq 8 ]
  then
    CMD="$DIR_P2/bin/vad --alpha1=$1 --alpha2=$2 --frame_time_ms=$3 --max_st_maybe_silence=$4 --max_st_maybe_voice=$5 --pnumber_init=$6 --alpha1zero=$7 --alpha2zero=$8"
fi
if [ $# -eq 9 ]
  then
    CMD="$DIR_P2/bin/vad --alpha1=$1 --alpha2=$2 --frame_time_ms=$3 --max_st_maybe_silence=$4 --max_st_maybe_voice=$5 --pnumber_init=$6 --alpha1zero=$7 --alpha2zero=$8 --min_silence=$9"
fi
if [ $# -eq 10 ]
  then
    CMD="$DIR_P2/bin/vad --alpha1=$1 --alpha2=$2 --frame_time_ms=$3 --max_st_maybe_silence=$4 --max_st_maybe_voice=$5 --pnumber_init=$6 --alpha1zero=$7 --alpha2zero=$8 --min_silence=$9 --min_voice=${10}"
fi

#CMD="$DIR_P2/bin/vad --alpha1=5"

for filewav in $DB/*/*wav; do
#    echo
    echo "**************** $filewav ****************"
    if [[ ! -f $filewav ]]; then 
	    echo "Wav file not found: $filewav" >&2
	    exit 1
    fi

    filevad=${filewav/.wav/.vad}

    $CMD -i $filewav -o $filevad || exit 1

# Alternatively, uncomment to create output wave files
#    filewavOut=${filewav/.wav/.vad.wav}
#    $CMD $filewav $filevad $filewavOut || exit 1

done

scripts/vad_evaluation.pl $DB/*/*lab

exit 0
