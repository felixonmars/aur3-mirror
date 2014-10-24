# Maintainer: Fabio Melo Pfeifer <fmpfeifer@gmail.com>

pkgname=liblightgrep
pkgver=1.4.0
_pkgver=1.4
pkgrel=1
pkgdesc="A true multi-pattern search engine"
arch=('x86_64')
url="http://www.lightboxtechnologies.com/lightgrep-engine/"
license=('GPL')
depends=('boost' 'icu>=54')

source=(https://github.com/LightboxTech/liblightgrep/archive/v$_pkgver.tar.gz)
sha1sums=('a84ba29f6ef6c6cb334635d1467a6624b9d6fb1c')
provides=('liblightgrep')
conflicts=('liblightgrep')

build() {
    cd $srcdir/${pkgname}-$_pkgver
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

package() {
    cd $srcdir/${pkgname}-$_pkgver
    make DESTDIR=$pkgdir install
}
