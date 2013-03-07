# Maintainer: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Loya Liu <loya.liu@gmail.com>
# Contributor: Kristaps Esterlins <esterlinsh@gmail.com>

pkgname=gpick
pkgver=0.2.5
pkgrel=2
pkgdesc="Advanced color picker written in C++ using GTK+ toolkit"
arch=('i686' 'x86_64')
url="http://gpick.googlecode.com/"
license=('BSD')
depends=('gtk2>=2.24.0' 'hicolor-icon-theme' 'lua>=5.2')
makedepends=('scons' 'boost' 'flex' 'lemon')
install=$pkgname.install
source=(http://$pkgname.googlecode.com/files/${pkgname}_$pkgver.tar.gz)
md5sums=('4f34bed6a39ee39bac95ff1b10f679ed')

build() {
  cd "$srcdir/${pkgname}_$pkgver"
  scons
}

package() {
  cd "$srcdir/${pkgname}_$pkgver"
  scons DESTDIR="$pkgdir/usr" install
}
