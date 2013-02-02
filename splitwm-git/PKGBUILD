# Maintainer: Tomas Meszaros < exo at tty dot sk >

pkgname=splitwm-git
pkgver=20130202
pkgrel=1
pkgdesc='Window manager able to split screen into two individual/virtual screens'
arch=('i686' 'x86_64')
url='https://github.com/examon/splitwm'
license=('MIT/X')
depends=('libx11')
makedepends=('git')
provides=('splitwm')
conflicts=('splitwm')
_gitroot='git://github.com/examon/splitwm.git'
_gitname='splitwm'

build() {
    cd "$srcdir"
    if [ -d "$_gitname" ] ; then
        cd "$_gitname" && git pull origin
    else
        git clone "$_gitroot" "$_gitname"
    fi
    cd "$srcdir/$_gitname/src"
    make clean && make PREFIX=/usr
}

package() {
    cd "$srcdir/$_gitname/src"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    cd "$srcdir/$_gitname"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
