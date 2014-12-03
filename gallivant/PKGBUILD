# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gallivant
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple GPS and map application utilizing maps from the OpenStreetMap project"
arch=('i686' 'x86_64')
url="http://gallivant.sourceforge.net/"
license=('GPL')
depends=('curl' 'gpsd' 'qt4')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('5979c9b5170d338124aa0a01d6026f09')

build() {
  cd "${srcdir}"/$pkgname-$pkgver/src

  make QMAKE=/usr/bin/qmake-qt4
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver/src

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
}
