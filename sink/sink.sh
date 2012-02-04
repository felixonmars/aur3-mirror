#!/bin/bash
# sink.sh - a networked battleship game for Bourne-again shell.
#
# Copyright Gregory Bonik, 2009
# gregory@bonik.org
#
# Beerware licence is well applicable.


# All external stuff we use. Change if needed.
NETCAT=nc.traditional
STTY=stty
CLEAR=clear


##############################################################################
# Let there be code
##############################################################################

VERSION="0.0.1a"

CHAR_SHIP='@'
CHAR_ACTIVE='%'
CHAR_DEAD='X'
CHAR_WATER='~'
CHAR_MISS='o'
CHAR_CROSSHAIR='*'

EXENAME="$0"

quit() {
    read -t 0.5 -n 20
    $STTY echo
    exit $1
}

usage() {
    echo "Sink'em all - a networked battleship game for Bourne-again shell."
    echo "Version $VERSION"
    echo "Usage: $EXENAME [ -serve | HOST ] [ -p PORT ]"
    quit
}

title() {
    $CLEAR
    local SPACE="                                     "
    local MSG1_XXXXXXXXXXXXXXXXXXXXXXXXXXX="$MSG1${SPACE:0:$((33 - ${#MSG1}))}"
    local MSG2_XXXXXXXXXXXXXXXXXXXXXXXXXXX="$MSG2${SPACE:0:$((33 - ${#MSG2}))}"
    local MSG3_XXXXXXXXXXXXXXXXXXXXXXX="$MSG3${SPACE:0:$((29 - ${#MSG3}))}"
    local MSG4_XXXXXXXXXXXXXXXXXXXXXXX="$MSG4${SPACE:0:$((29 - ${#MSG4}))}"
    echo "O-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..O"
    echo ")                      .- .     | .   , _        .'| | |   |                   ("
    echo ")                      \`; | |\\| |\`.    (_' |\`|   :-: | |   .                   ("
    echo ')              .-.    _`_ _ _ _ _________________`_`_`_`_ _    .-.             ('
    echo ")             \`.' \`--'                ,__                  \`--' '.'            ("
    echo ")                                     ;__{                                     ("
    echo ") $MSG1_XXXXXXXXXXXXXXXXXXXXXXXXXXX   ;                                        ("
    echo ") $MSG2_XXXXXXXXXXXXXXXXXXXXXXXXXXX  |.------.                                 ("
    echo ")                                ;-----|      |                                ("
    echo ") $MSG3_XXXXXXXXXXXXXXXXXXXXXXX   |   \`------\`                                 ("
    echo ") $MSG4_XXXXXXXXXXXXXXXXXXXXXXX  \`---.------\\---                               ("
    echo ')                               ;-----|     \\  |                              ('
    echo ')                              /      |     \ \ |                              ('
    echo ')                              /     ;_______\ \                               ('
    echo ')                             ------.--------\  \                              ('
    echo ')                              / / / ;        \  \                             ('
    echo ')                             / / / / ;        \/                              ('
    echo ')                            / / / / /; .------/                               ('
    echo ")                           /-/-/-/-/-\`'_____//_,                              ("
    echo ")                          /                 #  }                              ("
    echo ")                          / o o  o o  o o   #  |               (C) 2009 G. B. ("
    echo ") ~  ~~..~~..  ..~~~.. ~~. \`~~~~~....._____#_-' ~~.. ~~.. ..~~~... ~~.. ~~.. ~ ("
    echo ") ~~  ..~~~..  ..~...  ..~~~. ~~..~~   ~~..~~  ~~..~~ ~~..~~..~~..~  ~~  ~~ ~  ("
    echo -n "O-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..O"
}

redraw() {
    local i j
    local SPACE="                                                                                    "
    local H="${HINT[0]}"
    $CLEAR
    echo "O-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..O"
    echo ")                      .- .     | .   , _        .'| | |   |                   ("
    echo ")                      \`; | |\\| |\`.    (_' |\`|   :-: | |   .                   ("
    echo ')              .-.    _`_ _ _ _ _________________`_`_`_`_ _    .-.             ('
    echo ")             \`.' \`--'                                     \`--' '.'            ("
    echo ") o~-~-~-~-~-~-~-~-~-~-~-~-~o o-~-~-~-~-~-~-~-~-~-~-~-~-o o-~-~-~-~-~-~-~-~-~o ("
    echo ") ;    a b c d e f g h i j  | ;    a b c d e f g h i j  | ; $H${SPACE:0:$((16-${#H}))} | ("
    local S1="|"
    local S2=";"
    for (( i = 0; i < 10; ++i )) ; do
        echo -n ") $S1 $(( (i + 1) % 10))  "
        for (( j = 0; j < 10; ++j )) ; do
            echo -n "${THY[$((i*10 + j))]} "
        done
        echo -n " $S2 $S1 $(( (i + 1) % 10))  "
        for (( j = 0; j < 10; ++j )) ; do
            echo -n "${FOE[$((i*10 + j))]} "
        done
        H="${HINT[$((i + 1))]}"
        local HINTX="$H${SPACE:0:$((16 - ${#H}))}"
        echo " $S2 $S1 $HINTX $S2 ("
        local SWAP="$S1"
        S1="$S2"
        S2="$SWAP"
    done
    echo ") o~-~-~-~-~-~-~-~-~-~-~-~-~o o-~-~-~-~-~-~-~-~-~-~-~-~-o o-~-~-~-~-~-~-~-~-~o ("
    echo ")                                                                              ("
    local MSGX="$MSG${SPACE:0:$((72 - ${#MSG}))}"
    local MSG2X="$MSG2${SPACE:0:$((72 - ${#MSG2}))}"
    echo ") o-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~o ("
    echo ") | $MSGX | ("
    echo ") | $MSG2X | ("
    echo ") o~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-o ("
    echo -n "O-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..-~-..O"
}

initfields() {
    local i j
    for (( i = 0; i < 100; ++i )) ; do
        THY[$i]=$CHAR_WATER
        FOE[$i]=$CHAR_WATER
    done
}

placeship() {
    local imin=$((ROW - 1))
    local jmin=$((COL - 1))
    local imax=$((ROW + H + 1))
    local jmax=$((COL + W + 1))
    local i j

    ((imin < 0))  && imin=0
    ((jmin < 0))  && jmin=0
    ((imax > 10)) && imax=10
    ((jmax > 10)) && jmax=10


    for (( i = imin; i < imax; ++i )) ; do
        for (( j = jmin; j < jmax; ++j )) ; do
            [[ "${THY[$((i*10 + j))]}" == "$CHAR_SHIP" ]] && return 1
        done
    done
    
    for (( i = 0; i < H; ++i )) ; do
        for (( j = 0; j < W; ++j )) ; do
            THY[$(((ROW + i)*10 + j + COL))]="$CHAR_SHIP"
            THYSHIP[$(((ROW + i)*10 + j + COL))]=$(( 10 - LEFT ))
        done
    done

    (( --LEFT ))
    (( --SHIPS[SHIP] ))
    (( SHIPS[SHIP] < 1 )) && (( ++SHIP ))
    (( SHIP > 3 )) && return 0
    (( W = 4 - SHIP ))
    (( H = 1 ))
    (( ROW = 0 ))
    (( COL = 0 ))

    return 0
}

arrayget() {
    local ARR="$1"
    local IDX="$2"
    eval echo \${$ARR[$IDX]}
}

arrayset() {
    local ARR="$1"
    local IDX="$2"
    eval $ARR[$IDX]="$3"
}

automiss() {
    local imin="$((CELL / 10))"
    local jmin="$((CELL % 10))"
    local imax="$imin"
    local jmax="$jmin"
    local c="$CELL"
    local i j

    for (( c = $CELL; imin > 0; --imin )) ; do
        [ "$(arrayget $1 $c)" == "$CHAR_DEAD" ] || break
        (( c -= 10 ))
    done
    for (( c = $CELL; imax < 9; ++imax )) ; do
        [ "$(arrayget $1 $c)" == "$CHAR_DEAD" ] || break
        (( c += 10 ))
    done
    for (( c = $CELL; jmin > 0; --jmin )) ; do
        [ "$(arrayget $1 $c)" == "$CHAR_DEAD" ] || break
        (( c -= 1 ))
    done
    for (( c = $CELL; jmax < 9; ++jmax )) ; do
        [ "$(arrayget $1 $c)" == "$CHAR_DEAD" ] || break
        (( c += 1 ))
    done

    for (( i = imin; i <= imax; ++i )) ; do
        for (( j = jmin; j <= jmax; ++j )) ; do
            echo "$i $j $(arrayget $1 $((i*10 + j)) )"
            if [ "$(arrayget $1 $((i*10 + j)) )" == "$CHAR_WATER" ] ; then
                arrayset $1 $((i*10 + j)) "$CHAR_MISS"
            fi
        done
    done
}

checkconnection() {
    if [ -z "$COPROC_PID" ] ; then
        echo "Connection closed"
        quit
    fi
}

placeships() {
    SHIPS=( 1 2 3 4 )
    THYDECKS=20
    THYSHIPDECKS=( 4 3 3 2 2 2 1 1 1 1 )
    FOEDECKS=20
    SHIP=0
    LEFT=10
    ROW=0
    COL=0
    W=4
    H=1
    WIN=0
    HINT=(  "Keys:" " "
            "w   Up          "
            "a   Left        "
            "s   Down        "
            "d   Right       "
            "r   Rotate ship "
            "p   Place ship  "
    )
    MSG="Place your ships."

    while (( LEFT > 0 )) ; do
        BACKUP=( "${THY[@]}" )
        for (( i = 0; i < H; ++i )); do
            for (( j = 0; j < W; ++j )); do
                THY[$(( (i + ROW) * 10 + j + COL ))]="$CHAR_ACTIVE"
            done
        done

        redraw

        THY=( "${BACKUP[@]}" )

        if ! read -sn 1 KEY ; then
            quit
        fi
        checkconnection

        MSG="Place your ships."
        case "$KEY" in
            w) ((--ROW)) ;;
            a) ((--COL)) ;;
            s) ((++ROW)) ;;
            d) ((++COL)) ;;
            r) TMP=$W; W=$H; H=$TMP ;;
            p)
                if placeship ; then
                    MSG="Ship placed."
                else
                    MSG="Cannot place ship here because "
                    MSG+="another ship is too close"
                fi
                ;;
        esac

        if (( ROW < 0 )) ; then ROW=0 ; fi
        if (( COL < 0 )) ; then COL=0 ; fi
        if (( ROW + H > 10 )) ; then ((ROW = 10 - H)); fi
        if (( COL + W > 10 )) ; then ((COL = 10 - W)); fi
    done
}

waitturn() {
    redraw
    while true; do
        checkconnection
        if ! read -u "${COPROC[0]}" CELL ; then
            echo "Connection closed"
            quit
        fi

        if (( CELL < 0 || CELL > 99 )) ; then
            echo "Received malformed data, exiting"
            quit
        fi

        CELL=$((CELL))

        if [ "${THY[$CELL]}" == "$CHAR_SHIP" ] ; then
            THY["$CELL"]="$CHAR_DEAD"
            (( --THYDECKS ))
            (( --THYSHIPDECKS[THYSHIP[CELL]] ))

            if (( THYSHIPDECKS[THYSHIP[CELL]] > 0 )) ; then
                MSG="Enemy has hit your ship!"
                echo hit >&"${COPROC[1]}"
            else
                MSG="Enemy has sunk your ship!"
                echo sunk >&"${COPROC[1]}"
            fi

            if (( THYDECKS == 0 )) ; then
                MSG="All your ships have been sunk. You've lost the game :("
                return 1
            fi
        else
            if [ "${THY[$CELL]}" == "$CHAR_WATER" ] ; then
                THY["$CELL"]="$CHAR_MISS"
            fi

            MSG="Enemy has missed. Your turn."
            echo miss >&"${COPROC[1]}"
            break
        fi
        redraw
    done
    redraw
    return 0
}

hitfoe() {
    FOE["$CELL"]="$CHAR_DEAD"
    (( --FOEDECKS ))
    if (( FOEDECKS == 0 )) ; then
        MSG="Congratulations! You have won! :-)"
        WIN=1
        return 1
    fi
    return 0
}

fire() {
    if [ "${FOE[$CELL]}" != "$CHAR_WATER" ] ; then
        MSG='Already shot there! Choose another target.'
        redraw
        return 1
    fi

    checkconnection
    echo "$CELL" >&"${COPROC[1]}"

    checkconnection
    if ! read -u "${COPROC[0]}" HIT ; then
        echo "Connection closed"
        quit
    fi
    
    if [ "$HIT" == "hit" ] ; then
        MSG="You have hit! Your turn again."
        hitfoe || return 0
        return 1
    else
        if [ "$HIT" == "sunk" ] ; then
            MSG="You have sunk enemy's ship! Your turn again."
            hitfoe || return 0
            automiss FOE
            return 1
        fi
    fi
    
    FOE["$CELL"]="$CHAR_MISS"
    MSG="You have missed. Now waiting enemy's turn..."
    redraw

    return 0
}

maketurn() {
    COL=0
    ROW=0
    HINT=(  "Keys:           "
            "                "
        "w      Up" "a      Left" "s      Down" "d      Right" "f      Fire"
    )

    while true; do
        CELL=$(( ROW*10 + COL ))
        BACKUP="${FOE[$CELL]}"
        FOE[$CELL]="$CHAR_CROSSHAIR"
        redraw
        FOE[$CELL]=$BACKUP

        if ! read -sn 1 KEY ; then
            quit
        fi
        checkconnection

        case "$KEY" in
            w) ((--ROW)) ;;
            a) ((--COL)) ;;
            s) ((++ROW)) ;;
            d) ((++COL)) ;;
            f) fire && break ;;
        esac

        (( ROW < 0 ))   && ROW=0
        (( COL < 0 ))   && COL=0
        (( ROW >= 10 )) && ROW=9
        (( COL >= 10 )) && COL=9
    done

    return $WIN
}

$STTY -echo

# Parse command-line options
SERVE=0
HOST=""
PORT=21366

while (( $# > 0 )) ; do
    case "$1" in
        "-serve")
            SERVE=1
            ;;
        "-p")
            if (( $# < 2 )); then usage; fi
            PORT=$2
            shift
            ;;
        -*)
            echo "Unknown option $1"
            usage
            ;;
        *)
            if [ -n "$HOST" ]; then usage; fi
            HOST=$1
            ;;
    esac
    shift
done

if [ -z "$HOST" ] && (( SERVE == 0 )) ; then
    echo "Need a hostname."
    usage
fi

$CLEAR
HELLOSTR="Hi, I want to play a game with you"

if (( SERVE == 1 )) ; then
    MSG1="Waiting for incoming"
    MSG2="connection on port $PORT..."
    title
    coproc $NETCAT -q 0 -l -p "$PORT"
    READTIMEOUT=180
else
    MSG1="Connecting to"
    MSG2="$HOST:$PORT..."
    coproc $NETCAT -w 5 -q 0 "$HOST" "$PORT"
    READTIMEOUT=5
fi

echo "$HELLOSTR" >&${COPROC[1]}

checkconnection
if ! read -t "$READTIMEOUT" -u "${COPROC[0]}" HELLO ; then
    echo "Failed to connect, exiting."
    quit 1
fi

if [ "$HELLO" != "$HELLOSTR" ] ; then
    echo "Unknown peer at the other end of connection, exiting."
    quit 1
fi

#echo "Connected! Press ENTER to start placing ships!"
MSG1="Connected!"
MSG2=""
MSG3="Press ENTER to start"
MSG4="placing ships"
title
read

checkconnection

while true; do
    MSG=""
    MSG2=""
    initfields
    placeships
    HINT=()

    MSG="All ships placed. Waiting for the enemy..."
    redraw
    checkconnection

    THYNUMBER=$RANDOM
    echo "$THYNUMBER" >&${COPROC[1]}

    checkconnection
    if ! read -u "${COPROC[0]}" FOENUMBER ; then
        echo "Connection closed"
        quit
    fi

    if (( FOENUMBER > THYNUMBER )) ; then
        MSG="Enemy's turn is first. Waiting..."
        waitturn || LOST=1
    else
        MSG="You turn."
    fi

    while ((LOST != 1)); do
        maketurn || break
        HINT=()
        waitturn || break
    done
    HINT=()

    MSG2="Play again? (y/n)"
    redraw

    while read -n 1 YESNO ; do
        checkconnection
        if [ "$YESNO" == 'y' ] || [ "$YESNO" == 'Y' ] ; then
            continue 2
        fi
        if [ "$YESNO" == 'n' ] || [ "$YESNO" == 'N' ] ; then
            break 2
        fi
    done
    break
done

if [ -n "$COPROC_PID" ] ; then
    kill $COPROC_PID
    wait $COPROC_PID
fi

quit

