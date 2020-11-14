
active="/home/zack/gctest/games/active"
all="/home/zack/gctest/games/all"
favorites="/home/zack/gctest/games/favorites"
nostalgia="/home/zack/gctest/games/nostalgia"
temp="/home/zack/gctest/games/.temp"

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
        ;;
    favorites)
        swap $active $favorites
        ;;
    nostalgia)
        swap $active $nostalgia
        ;;
esac
