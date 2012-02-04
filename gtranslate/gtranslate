#!/bin/bash

# author: MRashad10

if [ "$1" == "-h" -o "$1" == "--help" -o $# == 0 ]; then

    echo "
NAME
    gtranslate - translates text from given language to given language

SYNOPSIS
    gtranslate [FROM] [TO] [TEXT]
    
FROM - code of language you want to translate from
TO - code of language you want to translate to
TEXT - your text

POSSIBLE LANGUAGES AND THEIR CODES
    auto - Special code - automatic recognition of language

    af      - Africaans
    sq      - Albanian
    ar      - Arabic
    hy      - Armenian
    az      - Azerbaijani
    eu      - Basque
    be      - Belarusian
    bg      - Bulgarian
    ca      - Catalan
    zh-CN   - Chinese
    hr      - Croatian
    cs      - Czech
    da      - Danish
    nl      - Dutch
    en      - English
    et      - Estonian
    tl      - Filipino
    fi      - Finnish
    fr      - French
    gl      - Galician
    ka      - Georgian
    de      - German
    el      - Greek
    ht      - Haitian Creole
    iw      - Hebrew
    hi      - Hindi
    hu      - Hungarian
    is      - Icelandic
    id      - Indonesian
    ga      - Irish
    it      - Italian
    ja      - Japanese
    ko      - Korean
    la      - Latin
    lv      - Latvian
    lt      - Lithuanian
    mk      - Macedonian
    ms      - Malay
    mt      - Maltese
    no      - Norwegian
    fa      - Persian
    pl      - Polish
    pt      - Portuguese
    ro      - Romanian
    ru      - Russian
    sr      - Serbian
    sk      - Slovak
    sl      - Slovenian
    es      - Spanish
    sw      - Swahili
    sv      - Swedish
    th      - Thai
    tr      - Turkish
    uk      - Ukrainian
    ur      - Urdu
    vi      - Vietnamese
    cy      - Welsh
    yi      - Yiddish
";

fi


if [ $# == 3 ]; then

    echo -e "From: $1 \nTo: $2\n"
    lynx -dump "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$3&langpair=$1|$2"|awk -F'"' '{print $6}'
fi 
