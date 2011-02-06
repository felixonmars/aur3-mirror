# Maintainer: Victor van den Elzen <victor.vde@gmail.com>

pkgname=pachi
pkgver=1.0
pkgrel=1
pkgdesc="Pachi el Marciano is a cartoonish 2D platformer."
arch=('i686' 'x86_64')
url="http://dragontech.sourceforge.net/index.php?main=pachi&lang=en"
license=('GPL')
depends=('sdl' 'sdl_mixer')
backup=('var/lib/games/pachi/data/scores.dat')
source=("http://downloads.sourceforge.net/project/dragontech/Pachi%20el%20marciano/Pachi%20el%20marciano%20${pkgver}/pachi_source.tgz")
md5sums=('64906110d6236adc15c81910b43a1ae9')

build() {
    cd "${srcdir}/Pachi"

    ./configure --prefix=/usr
    sed -i 's/\(chgrp [^ ]*\) \(.*\)/\1 ${DESTDIR}\2/' data/Makefile
    sed -i 's/\(chmod [^ ]*\) \(.*\)/\1 ${DESTDIR}\2/' data/Makefile

    make
}

package()
{
    cd "${srcdir}/Pachi"

    make DESTDIR="${pkgdir}" install
}
