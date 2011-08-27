# Contributor: Florian Richter <mail@f1ori.de>

pkgname=pumpkin
pkgver=0.1.2
pkgrel=1
pkgdesc="LDAP to Python Object Mapper"
arch=(any)
url="http://pypi.python.org/pypi/pumpkin/0.1.2"
license=('GPL')
depends=('python' 'python-ldap' 'python-dateutil')
makedepends=()
options=(!emptydirs)
source=(http://files.prymitive.com/$pkgname-$pkgver.tar.gz)
md5sums=('f073cd5502a4a8bb33edbf2fc2be6afe')

build() {
  cd $srcdir/${pkgname}_$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
