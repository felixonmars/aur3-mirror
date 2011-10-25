# Maintainer: falkTX <falktx@gmail.com>

_p=klaudia
pkgname=klaudia
pkgver=1.0
pkgrel=2
pkgdesc="A multimedia application launcher with LADISH support"
arch=(any)
url="http://kxstudio.sf.net/klaudia"
license=('GPL2')
depends=("python2-pyqt" "dbus-python" "pyxdg" "xdg-utils")
makedepends=("python2-pyqt")
optdepends=("ladish: session support")
conflicts=("klaudia-git")
install="klaudia.install"
source=(https://downloads.sourceforge.net/project/kxstudio/Releases/klaudia/$pkgname-$pkgver.tar.gz)
md5sums=(846490e3ece6342ebeaadd9edeac778b)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
