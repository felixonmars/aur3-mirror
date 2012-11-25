# Maintainer: Bastien Dejean <baskerville at lavabit.com>

pkgname=dzen2-bare-git
pkgver=20120619
pkgrel=1
pkgdesc='X notification utility, Git version, no gadgets'
arch=('i686' 'x86_64')
url='http://sites.google.com/site/gotmor/dzen'
license=('MIT')
depends=('libxft')
makedepends=('git')
provides=('dzen2')
conflicts=('dzen2')
_gitroot='https://github.com/robm/dzen.git'
_gitname='dzen2'

build() {
    cd "$srcdir"
    if [ -d "$_gitname" ] ; then
        cd "$_gitname" && git pull origin
    else
        git clone "$_gitroot" "$_gitname"
    fi

    rm -rf "$srcdir/${_gitname}-build"
    cp -r "$srcdir/$_gitname" "$srcdir/${_gitname}-build"

    cd "$srcdir/${_gitname}-build"
    make
}

package() {
    cd "$srcdir/${_gitname}-build"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -D -m644 README "$pkgdir/usr/share/doc/$_gitname/README"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
}
