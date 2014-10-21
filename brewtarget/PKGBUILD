# Maintainer: Tyler Hall <tylerwhall at gmail dot com>
pkgname=brewtarget
pkgver=2.1.0
pkgrel=0
pkgdesc="Beer calculator compatible with BeerSmith. Generates instructions from the recipe and interactive mash designer."
url="http://brewtarget.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPL3'
         'WTFPL-2'
         'CCPL'
         'LGPL2.1')
depends=('qt4' 'qtwebkit' 'phonon')
optdepends=()
makedepends=('cmake')
conflicts=()
replaces=()
backup=()
source=("https://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}_${pkgver}.orig.tar.xz")
md5sums=('a709d8d9c20a5e9507dc6f134959d4ae')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING.GPLv3 "$pkgdir/usr/share/licenses/$pkgname/COPYING.GPLv3"
}

# vim:set ts=2 sw=2 et:
