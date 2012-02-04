# Maintainer: Alexandru Fera <alexandrufera at gmail dot com>
# Contributor: giniu <gginiu@gmail.com>

pkgname=grin
pkgver=1.2.1
pkgrel=1
pkgdesc="Searches directories of source code, alternative to grep and find."
arch=(any)
url="http://pypi.python.org/pypi/grin/"
license=('BSD')
depends=('python2')
makedepends=('setuptools')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/g/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d894426dfbf70bc105388c2a51348199')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i "37,39d" setup.py
  sed -i 's/env python$/env python2/' grin.py
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

