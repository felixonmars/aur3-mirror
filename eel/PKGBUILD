# Maintainer: lspci <agm2819 at gmail dot com>
pkgname=eel
pkgver=0.3.6
pkgrel=3
pkgdesc="EEL is a scripting and programming language, designed specifically for hard real time applications, but with other uses as well (run using 'EEL')"
url=("http://eel.olofson.net")
arch=('x86_64' 'i686')
license=('LGPL')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=("http://eel.olofson.net/download/EEL-${pkgver}.tar.bz2")
md5sums=('03a1ebefd68bd5c8bcb545a87f1b886e')

build() {
  cd "${srcdir}/EEL-${pkgver}"
#  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
   ./configure prefix=/usr
   make
 }

package() {
  cd "${srcdir}/EEL-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/EEL/COPYING"
 }

# vim:set ts=2 sw=2 et:
