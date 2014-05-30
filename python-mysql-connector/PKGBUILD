# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
pkgname=python-mysql-connector
_pkgname=mysql-connector-python
pkgver=1.2.2
pkgrel=1
pkgdesc="A standardized database driver for Python platforms and development"
arch=('any')
url="http://dev.mysql.com/downloads/connector/python/"
license=('GPL')
groups=()
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://cdn.mysql.com/Downloads/Connector-Python/$_pkgname-$pkgver.tar.gz)
md5sums=('15b0e95e6224ed7c9bfb685a9d54d356')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
