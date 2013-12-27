# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: Sairon Istyar <saironiq@gmail.com>
# based on an old version of lib32-gnutls from community repository

_pkgbasename=gnutls
pkgname=lib32-${_pkgbasename}26
pkgver=2.12.23
pkgrel=2
pkgdesc="A library which provides a secure layer over a reliable transport layer (32-bit, legacy version)"
arch=('x86_64')
license=('GPL3' 'LGPL')
url="http://www.gnu.org/software/gnutls/"
options=('!libtool')
# uses built-in libtasn1 for the moment
depends=(lib32-{gcc-libs,readline,libgcrypt,zlib})
makedepends=('gcc-multilib')
source=(ftp://ftp.gnutls.org/gcrypt/gnutls/v2.12/${_pkgbasename}-${pkgver}.tar.bz2)
md5sums=('f3c1d34bd5f113395c4be0d5dfc2b7fe')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgbasename}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32 \
    --with-zlib \
    --with-libgcrypt \
    --disable-static\
    --disable-guile

  make
}

package() {
  cd ${_pkgbasename}-${pkgver}

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{bin,include,share,lib32/{*.so,*-openssl.*,pkgconfig}}
}
