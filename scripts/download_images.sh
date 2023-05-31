#! /bin/bash


# normalise current working directory
cd "$(dirname ${0})"
# import function read_decklist
. ./read_decklist.sh


readonly fandom_base_url='https://yugioh.fandom.com/wiki/'
readonly image_path='../images'


# Parameters:
# 1. A card name with underscores (_) instead of whitespaces, no hash signs (#),
#    no dollar signs ($) and correct capitalisation
#    e.g. Mystical_Space_Typhoon
#    or a card passcode (eight-digit number in the bottom left corner of the card)
#    e.g. 05318639
function download_image() {
    echo ""
}



read_decklist | while read card; do

    download_image ${card}
    printf "."

done

echo "done"
