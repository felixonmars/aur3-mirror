# Maintainer: Nicolás de la torre <ndelatorre@gmail.com>
pkgname=python-rocket
pkgver=1.2.4
pkgrel=1
pkgdesc="Rocket Web Server"
arch=('any')
url="http://launchpad.net/rocket"
license=('MIT')
depends=('python')
source=(http://launchpad.net/rocket/trunk/$pkgver/+download/Rocket-src-$pkgver.zip)
md5sums=('63dc399f96734c91d0a0a8ee9d296b9b')
build() {
  cd $srcdir
  python setup.py install --root=$pkgdir/ --optimize=1
}
