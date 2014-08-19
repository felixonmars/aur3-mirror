# Maintainer: Lucas Hermann Negri <lucashnegri@gmail.com>

pkgname=lua-ldbi
pkgver=0.5.0
pkgrel=1
pkgdesc="PostgreSQL and SQLite bindings to Lua 5.2"
arch=(i686 x86_64)
url="http://oproj.tuxfamily.org"
depends=('lua' 'postgresql-libs>=8' 'sqlite>=3.0')
makedepends=('gcc')
license=(LGPL)
source=(https://bitbucket.org/lucashnegri/ldbi/downloads/ldbi-$pkgver.tar.gz)
md5sums=('4cc0e889042595900101506945ffa488')

build() {
    cd $srcdir/ldbi-$pkgver
    make PKG_PACKAGES=lua
}

package() {
    cd $srcdir/ldbi-$pkgver
    make install DESTDIR=$pkgdir/usr OUTDIR=lua/5.2 || 1
}
