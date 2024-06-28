#!/usr/bin/env bash

show_glyph() {
    local f=/Users/t-koseki/src/github.com/ryanoasis/nerd-fonts/bin/scripts/lib/$1
    source $f
    glyph_set=$(perl -nle '$. == 2 and s/#\s([\w\s-+]+)\s\(.+\)/\1/ and print and exit' $f)
    unset i

    for var in "${!i@}"; do
        # trim 'i_' prefix
        glyph_name=${var#*_}
        # replace _ with -
        glyph_name=${glyph_name/_/-}
        glyph_char=${!var}
        glyph_code=$(printf "%x" "'$glyph_char'")


        echo "$glyph_code $glyph_char $glyph_name '$glyph_set'"
    done

    unset ${!i@}
}

show_glyph i_dev.sh
show_glyph i_fa.sh
show_glyph i_fae.sh
show_glyph i_iec.sh
show_glyph i_linux.sh
show_glyph i_material.sh
show_glyph i_oct.sh
show_glyph i_ple.sh
show_glyph i_pom.sh
show_glyph i_seti.sh
show_glyph i_weather.sh
