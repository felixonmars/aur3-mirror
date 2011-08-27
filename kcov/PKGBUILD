# Maintainer: Thomas Burdick <thomas.burdick@gmail.com>
pkgname=kcov
pkgver=20101208
pkgrel=1
pkgdesc="C code coverage tool which uses debug symbols"
arch=('i686' 'x86_64')
url="http://simonkagstrom.github.com/kcov/index.html"
license=('GPLv2')
depends=('libdwarf')
makedepends=('cmake')
conflicts=()
provides=()

_gitroot="http://github.com/SimonKagstrom"
_gitname="kcov"

build() {
    msg "Connecting to github.com GIT server...."

    if [ -d ${_gitname} ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone ${_gitroot}/${_gitname}.git
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."


    cd $srcdir/kcov
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make || return 1
    make DESTDIR=$pkgdir/ install || return 1	
}

