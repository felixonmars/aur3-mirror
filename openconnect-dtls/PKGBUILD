# Contributor: dschauer, Dwight Schauer <dschauer@gmail.com>
pkgname=openconnect-dtls
_pkgname=openconnect
pkgver=2.12
pkgrel=1
pkgdesc="VPN client (intended to be) compatible with Cisco AnyConnect. (With DTLS support)"
arch=(i686 x86_64)
url="http://www.infradead.org/openconnect.html"
_srcurl=ftp://ftp.infradead.org/pub/openconnect
license=('LGPL')
groups=()
depends=(openssl-cisco-dtls)
makedepends=()
optdepends=()
provides=()
conflicts=(openconnect)
replaces=(openconnect)
backup=()
options=()
install=
source=("${_srcurl}/${_pkgname}-${pkgver}.tar.gz")
noextract=()

#md5sums=('5ba69238aa1c992a9dae8e5dd0471b7d')
md5sums=('2a9f97a6dd2627553dbf0c3ffbd5c05f')

_OPENSSL=/opt/openssl-cisco-dtls

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  msg "Starting make..."
  make clean
  make OPENSSL=${_OPENSSL} CC=gcc EXTRA_CFLAGS="-O2" all || return 1
  make DESTDIR="${pkgdir}" install
}
