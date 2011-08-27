# Maintainer: Zveroy <zy at aafg dot ws>
# Contributos: Jonas Haag <jonas at lophus dot org>
#              Pardi Tommaso <homer.j.simson.bis at gmail dot com>

pkgname=evilvte-new
pkgver=0.4.9
pkgrel=1
pkgdesc='VTE based, highly customizable terminal emulator'
arch=('i686' 'x86_64')
provides=('evilvte')
url='http://www.calno.com/evilvte/'
license=('GPL2')
depends=('vte' 'hicolor-icon-theme')
makedepends=('pkg-config')
source=("http://www.calno.com/evilvte/evilvte-${pkgver}.tar.gz")
md5sums=('1ed913fbe0749c44f382492d7d800ae7')
install=evilvte.install

build(){
    cd $srcdir/evilvte-${pkgver}

    if [ -e $startdir/config.h ]
    then
        echo config.h found.
    else
        cp ./src/config.h $startdir/

        echo Please edit $startdir/config.h to customize your options.

        if [ -n "$EDITOR" ] ; then
            "$EDITOR" "$startdir/config.h"
        fi
    fi

    cp -f $startdir/config.h ./src/
    ./configure --prefix=/usr || return 1

    make || return 1
    make DESTDIR=$pkgdir install || return 1
    make clean
}
