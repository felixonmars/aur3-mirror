# Contributor: Dominik Seemann kontakt@5in4.de

pkgname=namegenerator
pkgver=0.9
pkgrel=5
pkgdesc="a not so feature-rich database-driven name generator"
arch=(any)
url="http://namegenerator.5in4.de/"
license=("GPL")
depends=('python' 'pyqt')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=(http://namegenerator.5in4.de/$pkgname-$pkgver.tar.gz)
md5sums=('e00d6ef3b969d5621421df5b3fa10994')

install=

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1
}
