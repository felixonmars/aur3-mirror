pkgname=pacfind-git
pkgdesc="Enhanced package search tool for Arch Linux."
pkgver=20121106
pkgrel=1
url="https://github.com/andrewgregory/pacfind"
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('git' 'python2-docutils')
depends=('pacman')

_gitroot="https://github.com/andrewgregory/pacfind.git"
_gitname="pacfind"

build() {
    cd "$srcdir"

    msg "Connecting to GIT server...."

    if [ -d "$startdir/src/$_gitname" ] ; then
        cd "$_gitname"
        git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot"
        cd "$_gitname"
    fi

    msg "GIT checkout done or server timeout"

    make
}

package() {
    cd "$srcdir/$_gitname"
    make PREFIX=/usr DESTDIR=$pkgdir install
}
