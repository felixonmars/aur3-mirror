#Maintainer: karnath <karnathtorjian@gmail.com>

pkgname=qgoogletranslator
pkgver=1.2.1
pkgrel=1
pkgdesc="Translates text via Google Translate engine"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt>=4.6.0')
makedepends=('cmake' 'make')
url="http://code.google.com/p/qgt"
source=("http://qgt.googlecode.com/files/qgoogletranslator-1.2.1.tar.bz2")
md5sums=('52ef74f20213dc660e9482abab221a4c')
provides=("qgoogletranslate")
conflicts=("qgoogletranslate") 

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr  || return 1
    make || return 1
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR=$pkgdir install || return 1
}

