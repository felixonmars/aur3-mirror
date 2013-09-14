# Maintainer: Lucas Hermann Negri <lucashnegri@gmail.org>

pkgname=ldbi.sqlite
pkgver=0.4.0
pkgrel=1
pkgdesc="SQLite binding to Lua"
arch=(i686 x86_64)
url="http://oproj.tuxfamily.org"
depends=('lua>=5.1' 'sqlite3>=3.6')
makedepends=('gcc')
license=(LGPL)
source=(https://bitbucket.org/lucashnegri/ldbi/downloads/ldbi-$pkgver.tar.gz)
md5sums=('39c35c4e960b85ca4efb9529afde3e62')

build() {
    cd $srcdir/ldbi-$pkgver
    make _sqlite.so
}

package() {
    cd $srcdir/ldbi-$pkgver
    make install-sqlite DESTDIR=$pkgdir/usr || 1
}
