# Maintainer: Thomas Marchsteiner <tommy[0x2e]m86[0x40]gmail[0x2e]com>
# Contributor: Michael Asher <michael at wesolveeverything [dot] com>
pkgname=libhtp-git
_pkgname=libhtp
pkgver=20150208
pkgrel=1
pkgdesc="A security-aware parser for the HTTP protocol"
arch=('x86_64' 'i686')
url="http://freecode.com/projects/libhtp"
license=('BSD new')
groups=()
depends=()
makedepends=('autoconf' 'make' 'git')
optdepends=()
provides=('libhtp')
conflicts=('libhtp')
install=
changelog=
source=('git+https://github.com/OISF/libhtp')
sha256sums=('SKIP') 

build() {
  cd "$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
}
