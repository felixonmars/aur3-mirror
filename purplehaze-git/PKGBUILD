# Maintainer: Vincent Ollivier <me [at] vinc [dot] cc>

pkgname=purplehaze-git
pkgver=20120611
pkgrel=1
pkgdesc="Purple Haze is a Xboard compatible chess engine written in C++"
arch=('arm' 'i686' 'x86_64')
url="https://github.com/vinc/purplehaze"
license=('GPL3')
makedepends=('git')

_gitroot="git://github.com/vinc/purplehaze.git"
_gitname="purplehaze"

build()
{
    msg "Connecting to GIT server..."

    if [[ -d $_gitname ]]
    then
        cd $_gitname
        git pull origin
        msg "Local files updated"
    else
        git clone --depth 1 $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/$_gitname-build"
    cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    if test "$CARCH" == arm
    then
        sed -i "s/1024 \* 128/1024 * 32/g" src/common.h
        sed -i "s/  char /  signed char /g" src/main.cpp
        sed -i "s/  char /  signed char /g" src/move.h
    fi

    make
}

package()
{
    cd "$srcdir/$_gitname-build"
    install -Dm755 purplehaze "$pkgdir/usr/bin/purplehaze"
}
