pkgname=guile-dbd-sqlite3
pkgrel=2
pkgver=2.1.4
pkgdesc='Guile-dbi database driver for sqlite version 3'
arch=(any)
license=(gpl3)
makedepends=(git)
depends=(guile guile-dbi sqlite3)
source=("http://download.gna.org/guile-dbi/guile-dbd-sqlite3-2.1.4.tar.gz")
md5sums=(2b1c7126790e5e685a09b6e5f7920b08)
url=https://github.com/jkalbhenn/guile-dbd-sqlite3

build() {
 cd ${srcdir}/${pkgname}-${pkgver}
 ./configure --prefix=/usr || return 1
 make && make DESTDIR=${pkgdir} install || return 1
}
