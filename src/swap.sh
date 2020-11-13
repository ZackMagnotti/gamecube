
active="/home/zack/gctest/games/active"
all="/home/zack/gctest/games/all"
favorites="/home/zack/gctest/games/favorites"
nostalgia="/home/zack/gctest/games/nostalgia"
temp="/home/zack/gctest/games/.temp"

lib=$1

# TODO: add ability for script to reset directories if user passes no arguments

# function swaps the contents of two directories
function swap {
    mv $1/* $temp
    mv $2/* $1
    mv $temp/* $2
}

# function resets directories to the base state
function reset {
    for d in $all $favorites $nostalgia $active
    do
        if [ -f "$d/README.md" ]; then
            active_lib=$d
        fi
    done

    if [$active_lib != $active]; then
        swap $active_lib $active
    fi
}

# Main Logic

reset

lib=$1

case $lib in
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
