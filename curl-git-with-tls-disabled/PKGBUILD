# Maintainer: Keyvan Hedayati <k1.hedayati93@gmail.com>

pkgname=curl-git-with-tls-disabled
pkgver=7.34.0
pkgrel=3
pkgdesc="An URL retrieval utility and library (TLS Disabled)"
arch=('i686' 'x86_64')
url="http://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'libssh2' 'openssl' 'zlib')
provides=('curl=7.34.0')
conflicts=('curl')
options=('!libtool')
source=("git://github.com/bagder/curl.git"
        0001-Disabled-TLS.patch
        curlbuild.h)
md5sums=('SKIP'
         'bde8ee62c183a0259bd433a90bcd2d7f'
         '751bd433ede935c8fae727377625a8ae')

prepare() {
  cd curl

  #git describe | sed 's/curl-//; s/[_-]/./g'
  patch -Np1 <"$srcdir"/0001-Disabled-TLS.patch
}

build() {
  cd curl

  ./buildconf
  ./configure \
      --prefix=/usr \
      --mandir=/usr/share/man \
      --disable-ldap \
      --disable-ldaps \
      --enable-ipv6 \
      --enable-manual \
      --enable-versioned-symbols \
      --enable-threaded-resolver \
      --without-libidn \
      --without-librtmp \
      --with-random=/dev/urandom \
      --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt

  make
}

package() {
  cd curl

  make DESTDIR="$pkgdir" install

  local ptrsize=$(cpp <<<'__SIZEOF_POINTER__' | sed '/^#/d')
  case $ptrsize in
    8) _curlbuild=curlbuild-64.h ;;
    4) _curlbuild=curlbuild-32.h ;;
    *) error "unknown pointer size for architecture: %s bytes" "$ptrsize"
      exit 1
      ;;
  esac

  install -Dm644 docs/libcurl/libcurl.m4 $pkgdir/usr/share/aclocal/libcurl.m4
  mv "$pkgdir/usr/include/curl/curlbuild.h" "$pkgdir/usr/include/curl/$_curlbuild"
  install -m 644 $srcdir/curlbuild.h "$pkgdir/usr/include/curl/curlbuild.h"

  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}