# Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Florian Pritz <flo@xssn.at>

_pkgbase=curl
pkgname=lib32-${_pkgbase}
pkgver=7.29.0
pkgrel=1
pkgdesc="An URL retrieval utility and library (32-bit)"
arch=('x86_64')
url="http://curl.haxx.se"
license=('MIT')
depends=('lib32-zlib' 'lib32-openssl' 'lib32-libssh2' "${_pkgbase}")
makedepends=('gcc-multilib' 'ca-certificates')
options=('!libtool')
source=("http://curl.haxx.se/download/${_pkgbase}-${pkgver}.tar.gz")
md5sums=('4f57d3b4a3963038bd5e04dbff385390')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  
  # workaround to avoid error during ./configure
  CFLAGS=${CFLAGS/-D_FORTIFY_SOURCE=2/}
  CPPFLAGS="$CPPFLAGS -D_FORTIFY_SOURCE=2"
  
  cd ${_pkgbase}-${pkgver}

  ./configure \
      --prefix=/usr \
      --mandir=/usr/share/man \
      --disable-dependency-tracking \
      --disable-ldap \
      --disable-ldaps \
      --enable-ipv6 \
      --disable-manual \
      --enable-versioned-symbols \
      --enable-threaded-resolver \
      --without-libidn \
      --with-random=/dev/urandom \
      --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
      --libdir=/usr/lib32
      
  make
}

package() {
  cd ${_pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{share,bin}
  #remove all headers, except for curlbuild.h
  find "${pkgdir}/usr/include/curl" -type f -not -name curlbuild.h -delete
  mv "${pkgdir}/usr/include/curl/curlbuild.h" "${pkgdir}/usr/include/curl/curlbuild-32.h"

  install -dm755 "${pkgdir}/usr/share/licenses"
  ln -s ${_pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}
