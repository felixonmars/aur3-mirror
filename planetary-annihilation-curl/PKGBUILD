# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=planetary-annihilation-curl
pkgver=7.23.0
pkgrel=1
pkgdesc="libcurl compiled specifically for planetary-annihilation, and placed out of the way for other programs."
arch=("x86_64")
url="http://www.uberent.com/pa/"
license=("MIT")
depends=(ca-certificates  krb5  libssh2  openssl  zlib)
options=("!libtool" "!strip")
source=(http://curl.haxx.se/download/curl-${pkgver}.tar.gz)
md5sums=('018a9acee77ed70017c6f6cec855635a')

prepare() {
  cd "$srcdir/curl-${pkgver}"
  ./configure
}

build() {
  cd "$srcdir/curl-${pkgver}"
  make
}

package() {
  cd "$srcdir/curl-${pkgver}"
  install -Dm 644 "lib/.libs/libcurl.so.4" "${pkgdir}/opt/PA/libcurl.so.4"
}

