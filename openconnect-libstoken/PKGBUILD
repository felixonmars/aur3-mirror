# Maintainer: Dorin Sirbu <sarbudorin@gmail.com>
pkgname=openconnect-libstoken
_pkgname=openconnect
pkgver=6.00
pkgrel=1
pkgdesc="VPN client compatible with Cisco AnyConnect. (With libstoken support)"
arch=(i686 x86_64)
url="http://www.infradead.org/openconnect.html"
_srcurl=ftp://ftp.infradead.org/pub/openconnect
license=('LGPL')
groups=()
depends=(libxml2 zlib gnutls )
makedepends=('stoken-git')
optdepends=()
provides=()
conflicts=(openconnect)
replaces=(openconnect)
backup=()
options=()
install=
source=("${_srcurl}/${_pkgname}-${pkgver}.tar.gz")
noextract=()

md5sums=('7e28e23c6e281be31446e6c365f5d273')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  msg "Starting make..."
  ./configure --with-gnutls --prefix=/usr
  make CC=gcc EXTRA_CFLAGS="-O2" || return 1
  make DESTDIR="${pkgdir}" install 
}
