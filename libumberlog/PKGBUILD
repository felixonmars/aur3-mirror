# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Brian Knox <taotetek@gmail.com>

pkgname=libumberlog
pkgver=0.3.0
pkgrel=2
pkgdesc="CEE-enhanced syslog() API"
arch=(i686 x86_64)
license=(BSD)
url=https://github.com/deirf/$pkgname
options=(!libtool)
source=($url/archive/$pkgname-$pkgver.zip)
sha256sums=('3ad675f6017bd40739b3550c90ccf29feb8bb30f3e7edd25831df6bb5f3c808f')
sha512sums=('4505abef505749ea3567cf284b0b43a8bb3266fff834ce5905038d6e142e821f969cd90fe4a17b63ed28beb9be0fcc54b808ee61bca2eb3242e5cab18ed22871')

prepare() {
    sed -i -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' -e 's/AM_PROG_CC_STDC/AC_PROG_CC/' $pkgname-$pkgname-$pkgver/configure.ac
}

build() {
    cd $pkgname-$pkgname-$pkgver/
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

package() {
    make -C $pkgname-$pkgname-$pkgver DESTDIR="$pkgdir" install
}
