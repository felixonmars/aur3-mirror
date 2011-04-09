# Maintainer: Nicholas Ring <nring8@gmail.com>

pkgname="jsure-git"
pkgver=20110409
pkgrel=1
pkgdesc="A fast, standalone Javascript checker."
arch=('i686' 'x86_64')
url="https://github.com/berke/jsure"
license=('LGPL3')
depends=('ocaml')
makedepends=('git' 'aurochs-git')
provides=('jsure')

_gitroot="https://github.com/berke/jsure.git"
_gitname="jsure"

build() {
    cd $srcdir

    msg "Connecting to GIT server..."
    if [ -d $_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
    else
      git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."
    cd "$srcdir/$_gitname"
    make clean
    make || return 1
    mkdir -p "$pkgdir/usr/bin" || return 1
    PREFIX="$pkgdir/usr" make install
}
