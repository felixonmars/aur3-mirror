# Contributor: Bartłomiej Piech <youremail@domain.com>

pkgname=gameobjects
pkgver=0.0.3
pkgrel=1
pkgdesc="Collection of classes, and algorithms for helping in the creation of games."
arch=(any)
url="http://code.google.com/p/gameobjects/"
license=('BSD')
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://gameobjects.googlecode.com/files/$pkgname-$pkgver.zip)
md5sums=('446d7a819589a6879e163de0849d5b5e')
sha1sum=('1f6624123796131429d47476a036ecc7680ec521')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1
}
