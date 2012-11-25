# Maintainer: Bastien Dejean <baskerville at lavabit dot com>

pkgname=most-git
pkgver=20120223
pkgrel=1
pkgdesc="A terminal pager similar to 'more' and 'less'"
arch=('any')
url='http://www.jedsoft.org/most/index.html'
license=('GPL')
depends=('slang-git')
makedepends=('git')
provides=('most')
conflicts=('most')
_gitroot='git://git.jedsoft.org/git/most.git'
_gitname='most'

build() {
    cd "$srcdir"
    if [ -d "$_gitname" ] ; then
        cd "$_gitname" && git pull origin
    else
        git clone "$_gitroot" "$_gitname"
    fi

    cd "$srcdir/$_gitname"
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR=$pkgdir install
}
