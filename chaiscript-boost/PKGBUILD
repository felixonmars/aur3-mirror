# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=chaiscript-boost
pkgver=4.3.0
pkgrel=1
pkgdesc="Embedded scripting language designed from the ground up to directly target C++, requires Boost"
arch=('any')
depends=('boost-libs')
makedepends=('boost' 'cmake')
url="http://www.chaiscript.com"
license=('BSD')
source=($pkgname.tar.gz::https://github.com/ChaiScript/ChaiScript/archive/Release-$pkgver.tar.gz)
sha256sums=('6721ffb1b11386d3b897243561fdc04148d0632597ee466b345a30d21a44622e')
provides=('chai' 'chaiscript')
conflicts=('chai' 'chaiscript')

build() {
  cd ChaiScript-Release-$pkgver

  msg 'Building...'
  cmake -DCMAKE_INSTALL_PREFIX=/usr ./
  make chai
}

package() {
  cd ChaiScript-Release-$pkgver

  msg 'Installing...'
  make DESTDIR="$pkgdir" install
}
