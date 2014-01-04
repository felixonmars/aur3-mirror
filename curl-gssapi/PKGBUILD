# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=curl-gssapi
pkgver=7.34.0
pkgrel=1
pkgdesc="An URL retrieval utility and library"
arch=('i686' 'x86_64')
url="http://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'krb5' 'libssh2' 'openldap' 'openssl' 'zlib')
provides=('libcurl.so' "curl=${pkgver}")
conflicts=('curl')
options=('strip' 'debug')
source=("http://curl.haxx.se/download/curl-${pkgver}.tar.gz"{,.asc}
        0001-connect-Try-all-addresses-in-first-connection-attemp.patch
        curlbuild.h)
sha512sums=('d835163e3643672ec5f029c45f474c2125d6149d58d57931ecc9b2ee07feeeddc5c45683d055155f60d30f70d04b12e99097e75a5dcd23494ec92553a3d10c3e'
            'SKIP'
            'fdbf372c912b39c910c9b3e9f3efb3038280b9e9e48b613790915ea9579f2d1ab373e6e6de939ff81ac87e557177df02fabdb6f4a9ca38849e3cc84fddc054f3'
            '4e71366c3faaab76a6e438fcc484fb1ce16b2ae84eefa176879cf164e8fb0b04e4a355384e66a1137e9641e95041ee573553b43da98ec92820696d7256beb4f5')

prepare() {
  cd "${srcdir}/curl-${pkgver}"

  patch -p1 -i "${srcdir}"/0001-connect-Try-all-addresses-in-first-connection-attemp.patch
}

build() {
  cd "${srcdir}/curl-${pkgver}"

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --enable-ldap \
    --enable-ldaps \
    --enable-ipv6 \
    --enable-manual \
    --enable-versioned-symbols \
    --enable-threaded-resolver \
    --without-libidn \
    --with-random=/dev/urandom \
    --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
    --with-gssapi

  make
}

package() {
  cd "${srcdir}/curl-${pkgver}"

  make DESTDIR="${pkgdir}" install

  local ptrsize=$(cpp <<<'__SIZEOF_POINTER__' | sed '/^#/d')
  case $ptrsize in
    8) _curlbuild=curlbuild-64.h ;;
    4) _curlbuild=curlbuild-32.h ;;
    *) error "unknown pointer size for architecture: %s bytes" "$ptrsize"
      exit 1
      ;;
  esac

  # license
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # devel
  mv "${pkgdir}/usr/include/curl/curlbuild.h" \
    "${pkgdir}/usr/include/curl/${_curlbuild}"
  install -m644 "${srcdir}/curlbuild.h" "${pkgdir}/usr/include/curl/curlbuild.h"
}

# vim:set ts=2 sw=2 et:
