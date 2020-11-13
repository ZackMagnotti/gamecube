
active="/home/zack/gctest/games/active"
all="/home/zack/gctest/games/all"
favorites="/home/zack/gctest/games/favorites"
nostalgia="/home/zack/gctest/games/nostalgia"
temp="/home/zack/gctest/games/.temp"

lib=$1

case $1 in
    all)
        f=$all
    favorites)
        f=$favorites
    nostalgia)
        f=$nostalgia
esac

mv $f/* $temp
mv $active/* $f
mv $temp/* $active
