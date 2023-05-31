#! /bin/bash


# this script generates LaTeX code that inserts the card images into the document


# normalise current working directory
cd "$(dirname ${0})"
# import function read_decklist
. ./read_decklist.sh


readonly out_path='../tex/cards.tex'


function generate_tex() {
    line_count=''

    while read card; do

        # replace double quotes (") with single quotes (')
        card="$(echo "${card}" | sed "s/\"/\'/g")"

        # LaTeX code that inserts a card (% removes horizontal space between cards)
        echo "\card{${card}}%"

        # print a LaTeX line break after every fifth card
        line_count="${line_count}I"
        if [ ${line_count} = 'IIIII' ]; then
            line_count=''
            echo '\\[-0.34mm]'
        fi

    done
}


read_sources | generate_tex > "${out_path}"
