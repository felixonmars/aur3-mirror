# Maintainer: Bastien Dejean <baskerville@lavabit.com>

pkgname=pg_tail
pkgver=20130404
pkgrel=2
pkgdesc="'tail -f' your PostgreSQL tables."
arch=('i686' 'x86_64')
url='https://github.com/aaparmeggiani/pg_tail'
license=('MIT')
depends=('libpqxx')
makedepends=('git')
provides=('pg_tail')
conflicts=('pg_tail')
_gitroot='git://github.com/aaparmeggiani/pg_tail.git'
_gitname='pg_tail'
_gitsha='263ac12713e88b3cf5ac52a465d9b248d600e4d2'

build() {
    cd "$srcdir"
    if [ -d "$_gitname" ] ; then
        cd "$_gitname"
        git checkout master
        git pull origin master
    else
        git clone "$_gitroot" "$_gitname"
        cd "$_gitname"
    fi
    git checkout "$_gitsha"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$_gitname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}