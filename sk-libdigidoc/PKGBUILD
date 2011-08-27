# Maintainer: Marti Raudsepp <marti@juffo.org>
# Contributor: kevku <kevku@gmx.com>
pkgname=sk-libdigidoc
_pkgname=libdigidoc
pkgver=2.6.18
pkgrel=1
pkgdesc="C Library for digidoc.sk.ee client (Official version by AS Sertifitseerimiskeskus)"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('opensc' 'libxml2')
makedepends=()
provides=('sk-libdigidoc-svn')
conflicts=('libdigidoc-svn' 'sk-libdigidoc-svn')
source=(http://www.openxades.org/files/${_pkgname}-${pkgver}.zip)

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  # doesn't support make's -j
  export MAKEFLAGS=

  # zip unpacker marks all files executable, fix that
  find -type f -print0 |xargs -0 chmod -x
  chmod +x ./configure

  ./configure --sysconfdir=/etc --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}
md5sums=('e4d6f8899f47f3a44d01732d3b62cc70')
