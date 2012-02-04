pkgname=mingw32-curl-static
pkgver=7.21.1
pkgrel=1
pkgdesc="An URL retrival utility and library"
arch=(i686 x86_64)
url="http://curl.haxx.se"
license=('MIT')
depends=('mingw32-openssl-static' 'mingw32-zlib-static')
source=(http://curl.haxx.se/download/curl-${pkgver}.tar.bz2)
md5sums=(eafde5b933bce1c1dca82d1054c8d967)

build() {
  cd ${srcdir}/curl-${pkgver}
LDFLAGS=''
  ./configure --host=i486-mingw32 --build=mingw32 --without-ca-bundle --without-gnutls --without-random --with-zlib=/usr/i486-mingw32 --with-ssl=/usr/i486-mingw32 --prefix=/usr/i486-mingw32 --without-libidn --disable-ldap || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING || return 1
}

