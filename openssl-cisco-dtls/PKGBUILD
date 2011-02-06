# Contributor: dschauer, Dwight Schauer <dschauer@gmail.com>

pkgname=openssl-cisco-dtls
_pkgname=openssl
pkgver=0.9.8k
pkgrel=2
pkgdesc='openssl/crypto libraries only (with patch for Cisco DTLS) (does not conflict with standard package)'
arch=('i686' 'x86_64')
url='http://www.openssl.org'
license=('custom:BSD')
depends=('zlib' 'perl')
options=('!makeflags')

_dtls_patch=openssl-stable-dtls.patch
_install_dest=/opt/openssl-cisco-dtls

source=("http://www.openssl.org/source/${_pkgname}-${pkgver}.tar.gz"
  "${_dtls_patch}")

md5sums=('e555c6d58d276aec7fdc53363e338ab3'
         'dfa695372c61fa46cd851b87f0763bf7')

build() {
  cd $srcdir/$_pkgname-$pkgver

  patch -p0 -i $srcdir/${_dtls_patch} || return 1

  ./config --prefix=${_install_dest} shared zlib -Wa,--noexecstack

  make || return 1
  make test || return 1
  make INSTALL_PREFIX=${pkgdir} install_sw || return 1
  cp -a ${pkgdir}/${_install_dest}/lib/*.a ${pkgdir}/${_install_dest}/
}
