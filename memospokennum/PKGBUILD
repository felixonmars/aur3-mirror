# PKGBUILD for memospokennum
# Contributor: Oddbjørn Norstrand <gardintrapp@users.sourceforge.net>
pkgname=memospokennum
pkgver=1.0.0
pkgrel=1
pkgdesc="A memory training game"
arch=('any')
url="http://$pkgname.sourceforge.net/"
license=('GPL3')
depends=('python-pygame')
makedepends=('python')
optdepends=('pyqt: GUI')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('2b663c569bb329d3ee6ad98d5f357940')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --prefix $pkgdir/usr
}
