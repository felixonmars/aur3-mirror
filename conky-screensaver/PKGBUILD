# Maintainer: Eugen Sharayev <eugen0329@gmail.com>

pkgname="conky-screensaver"
_binary_name="conky-screensaver"
pkgver="0.1"
pkgrel=1

pkgdesc="Deep BETA(!!!) version of a conky-based screensaver"

arch=('any')

url="http://slim.berlios.de/"
license=('MIT')
depends=('slim' 'libconfig' 'gtk2' 'libnotify')
makedepends=('cmake')
source=('git+git://github.com/eugen0329/conky-screensaver')


sha1sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cmake -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  install -Dm755 "$srcdir/$pkgname/$_binary_name" "$pkgdir/usr/bin/$_binary_name"
}





