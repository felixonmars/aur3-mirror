# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=pynguin
pkgver=0.16
pkgrel=1
pkgdesc="Pynguin is meant to be an easy environment for introducing programming concepts to beginning programmers."
arch=('any')
url="https://code.google.com/p/pynguin/"
license=('GPL3')
depends=('python-qscintilla')
source=(https://pynguin.googlecode.com/files/$pkgname-$pkgver.tgz)
md5sums=('db8e2a134c20f78525f1e73bcc55c288')

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}