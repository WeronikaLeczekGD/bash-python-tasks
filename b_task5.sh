#!/bin/bash

if [[ $1 != "-i" ]] || [[ $3 != "-o" ]] ; then
        echo "Invalidt tet"
fi

if [ ! -f $2 ]; then
        echo "Input file does not exist"
        exit 1
fi

if [ -f $4 ]; then
        echo "Output file already exists"
        exit 1
fi

if [ -f $5 ]; then
        echo "Invalid input"
        exit 1
fi

if [[ $5 == "-s" ]]; then
        sed "s/$6/$7/g" < $2 > $4
        exit 0
fi

if [[ $5 == "-r" ]]; then
        tac < $2 > $4 
        exit 0
fi

if [[ $5 == "-l" ]]; then
        tr '[:upper:]' '[:lower:]' < $2 > $4
        exit 0
fi

if [[ $5 == "-u" ]]; then
        tr '[:lower:]' '[:upper:]' < $2 > $4
        exit 0
fi

if [ $# -eq 4 ]; then
        cp $2 $4
        exit 0
fi

if [ $# -gt 5 ]; then
        echo "Invalid syntax. Please use -i <input file> -o <output file> tags"
        exit 1
fi


# flag -v working using functions
function lowercase_to_uppercase() {

    tr '[:lower:]' '[:upper:]'

}

function uppercase_to_lowercase() {

    tr '[:upper:]' '[:lower:]'

}

if [ $5 == "-v" ];
then

if [[ $1 == "-i" ]] && [[ $3 == "-o" ]] && [[ $5 == "-v" ]] && [[ $(cat $2 | tr '[:upper:]' '[:lower:]') == $(cat $2) ]]; then

    cat $2 | lowercase_to_uppercase > $4
    else
        cat $2 | uppercase_to_lowercase > $4
fi

else
    echo "Invalid input"
fi
