# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Roman G <chesercat@gmail.com>

pkgname=ropeide
pkgver=1.5.1
pkgrel=4
pkgdesc="A Python refactoring IDE"
arch=('any')
url="http://rope.sourceforge.net/ropeide.html"
license=('GPL')
depends=('python2-rope' 'tk')
makedepends=('python2-distribute')
source=(http://downloads.sourceforge.net/rope/$pkgname-$pkgver.tar.gz)
md5sums=('c2432ff12805570b300272ad1add8d80')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
