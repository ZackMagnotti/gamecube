
active="/home/zack/gctest/games/active"
all="/home/zack/gctest/games/all"
favorites="/home/zack/gctest/games/favorites"
nostalgia="/home/zack/gctest/games/nostalgia"
temp="/home/zack/gctest/games/.temp"

lib=$1

# function swaps the contents of two directories
function swap {
    mv $1/* $temp
    mv $2/* $1
    mv $temp/* $2
}

function reset {
    for d in all favorites nostalgia
    do
        if [ -f "$d/README.md" ]; then
            active_lib=$d
        fi
    done

    swap $active_lib $active
}

case $lib in
    all)
        f=$all
        ;;
    favorites)
        f=$favorites
        ;;
    nostalgia)
        f=$nostalgia
        ;;
esac

if [ -f "$f/README.md" ]; then
    echo "$lib is active."
else
    if [ -f "$active/README.md" ]; then
        swap $f $active
    fi
fi
