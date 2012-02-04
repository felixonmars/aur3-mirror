pkgname=gazelle-git
pkgver=0
pkgrel=2
pkgdesc="a system for building fast, reusable parsers"
arch=('i686' 'x86_64')
url="http://www.reverberate.org/gazelle/"
license=('BSD')
depends=('lua' 'graphviz')
optdepends=('imagemagick')
makedepends=('lua' 'graphviz' 'asciidoc')
provides=('gazelle')
options=('!strip')
source=('0.patch' '1.patch' '2.patch' '3.patch' '4.patch' '5.patch' '6.patch')
md5sums=('2a897c783b39de62b8360509c274eb9f' '26c6d76e310dd5d9a9f478df1d154721'
         'db2400884e01c6c8d92d2d15197decd3' '26078933018ec3e738ac516ebc9025cd'
         'b9c927c62705b091384cc7fc2816dc04' '83c8bd1cc5ccca66d0bc1ca30d1cb1d9'
         'a7b691eb4affed62c6782d0e35234cd1')

[[ -z "$SRCDEST" ]] && SRCDEST=$startdir
export CARCH

_gitroot="git://github.com/haberman/gazelle.git"
_gitname=gazelle

build() {
# fetch sources
    if [ -d $SRCDEST/$_gitname ] ; then
        cd $SRCDEST/$_gitname && git pull origin
    else
        cd $SRCDEST && git clone $_gitroot $_gitname
    fi
    rm -rf $srcdir/$_gitname
    cp -a $SRCDEST/$_gitname $srcdir/$_gitname
    cd $srcdir/$_gitname || return 1
# patch
    # update utilities/srlua.c
    patch -p1 < $srcdir/0.patch
    # add suport for PATH to utilities/srlua.c
    patch -p1 < $srcdir/1.patch
    # add variable declaration to sketches/dump_to_html.lua
    patch -p1 < $srcdir/2.patch
    # add support for 64-bit machines
    patch -p1 < $srcdir/3.patch
    # solve documentation generation errors
    patch -p1 < $srcdir/4.patch
    # do not install as root
    patch -p1 < $srcdir/5.patch
    # install documentation
    patch -p1 < $srcdir/6.patch
# build
    make
    make doc
# install
    make install DESTDIR=$pkgdir
    make installdoc DESTDIR=$pkgdir
}
