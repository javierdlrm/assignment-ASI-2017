while IFS='\n' read -r line || [[ -n "$line" ]]; do
    if [ -z ${line:0:1} ] 
    then
	echo "-Línea en blanco"
    elif [ ${line:0:1} = "#" ]
    then
	echo "-Comentario"
    else
	IFS=' ' read -r maquina comando config error <<< "$line"
	
	echo "Línea: $maquina $comando $config"	
    fi
done < "$1"