$1 === comando
$2 === directorio jaula

#!/bin/bash

which=$(which $1)
mkdir -p $2/$(dirname $which)
cp $which $2/$which
ldd $which | grep "/"  | cut -d ">" -f2 | cut -d"(" -f1 | tr -d " \t" | while read linea;
do
    mkdir -p $2$(dirname $linea)
    cp $linea $2$linea
done



#sudo chroot $2 $1
