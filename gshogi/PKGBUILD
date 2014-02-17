# Maintainer: archtux <antonio dot arias99999 at gmail.com>

pkgname=gshogi
pkgver=0.4.5
pkgrel=2
pkgdesc="Shogi game(Japanese chess)"
arch=('any')
url="http://www.johncheetham.com/projects/gshogi/"
license=('GPL3')
depends=('pygtk')
source=(http://www.johncheetham.com/projects/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('95efc4c26a25f6aac048431eef3422d7')

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
}
