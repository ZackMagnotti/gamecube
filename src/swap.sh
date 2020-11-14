
active="/home/zack/gamecube/games/active"
all="/home/zack/gamecube/games/all"
favorites="/home/zack/gamecube/games/favorites"
nostalgia="/home/zack/gamecube/games/nostalgia"
temp="/home/zack/gamecube/games/.temp"

# function swaps the contents of two directories
function swap {
    if [ $1 != $2 ]; then
        mv $1/* $temp
        mv $2/* $1
        mv $temp/* $2
    fi
}

# function resets directories to the base state
function reset {
    for d in $all $favorites $nostalgia $active
    do
        if [ -f "$d/README.md" ]; then
            active_lib=$d
        fi
    done

    swap $active_lib $active
}

# Main Logic

reset

case $1 in
    all)
        swap $active $all
        echo "Switched to \"all\" library"
        ;;
    favorites)
        swap $active $favorites
        echo "Switched to \"favorites\" library"
        ;;
    nostalgia)
        swap $active $nostalgia
        echo "Switched to \"nostalgia\" library"
        ;;
    *)
        echo "Reset library"
esac
