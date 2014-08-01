# Maintainer: < aur AT ajs124 DOT de >

pkgname=evopedia
pkgver=0.4.4
pkgrel=1
pkgdesc='Offline Wikipedia Viewer'
arch=('i686' 'x86_64')
url='http://evopedia.info/'
license=('GPL3')
depends=('bzip2' 'qt4')
makedepends=('qt4')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/${pkgname}/${pkgname}_qt/archive/v${pkgver}.tar.gz")
sha256sums=('f5de259439e77aee68057375898ae609d0af38ddf7ba5ce1c830958c05f60840')

build() {
  cd "$srcdir/${pkgname}_qt-$pkgver"
  qmake-qt4 evopedia.pro PREFIX="$pkgdir"/usr
  make
}

package() {
  cd "$srcdir/${pkgname}_qt-$pkgver"
  make install
}

# vim:set ts=2 sw=2 et:
