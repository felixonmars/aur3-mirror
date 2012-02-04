# Maintainer: Jekyll Wu <adaptee at gmail [dot] com>

pkgname=kio-clipboard
pkgver=0.2.5
pkgrel=1
pkgdesc="Make the content of clipboards available inside file management"
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php?content=143976"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
source=("https://api.opensuse.org/public/source/home:arkascha/kio-clipboard/$pkgname-$pkgver.tar.bz2")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
md5sums=('98dc84d441eae8408569a55d2177c842')
