# Contributor: giniu <gginiu@gmail.com>
pkgname=python-testoob
pkgver=1.15
pkgrel=2
pkgdesc="Advanced Python testing framework."
arch=('any')
url="http://code.google.com/p/testoob/"
license=('Apache')
depends=('python2')
options=(!emptydirs)
source=(http://testoob.googlecode.com/files/testoob-${pkgver}.tar.bz2)
md5sums=('604d2556ac01ca8f5d189ad8ffe2c8e5')

build() {
  cd "$srcdir"/testoob-$pkgver
  python2 setup.py install --root="$pkgdir"/ --optimize=1 || return 1
}

