
active="/home/zack/gctest/games/active"
all="/home/zack/gctest/games/all"
favorites="/home/zack/gctest/games/favorites"
nostalgia="/home/zack/gctest/games/nostalgia"
temp="/home/zack/gctest/games/.temp"

lib=$1

function swap {
    mv $1/* $temp
    mv $2/* $1
    mv $temp/* $2
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

if [ -f "$active/$lib.md" ]; then
    echo "$lib is active."
else
    echo "$lib is not active"
fi
