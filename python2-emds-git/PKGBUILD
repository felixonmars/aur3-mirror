# Contributor: Andrew Grigorev <andrew@ei-grad.ru>
pkgname=python2-emds-git
pkgver=35.77d69b2
pkgrel=1
pkgdesc="EVE Market Data Structures and serializers"
arch=('any')
url="https://github.com/gtaylor/EVE-Market-Data-Structures"
license=('BSD')
depends=('python2' 'python2-ujson')
makedepends=('git')
provides=('python2-emds')
source=("emds::git+git://github.com/gtaylor/EVE-Market-Data-Structures.git")
md5sums=("SKIP")

pkgver() {
  cd $srcdir/emds
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $srcdir/emds
  python2 setup.py install --root=$pkgdir/
}
