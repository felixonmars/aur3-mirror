# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=kamaelia
pkgver=0.6.0
pkgrel=1
pkgdesc="A program for easy prototyping multimedia, network and broadcast aware systems"
arch=('any')
url="http://www.kamaelia.org/Home"
license=('MPL' 'GPL2' 'LGPL2.1')
depends=('python')
makedepends=('setuptools')
source=(http://www.kamaelia.org/release/${pkgname^k}-$pkgver.tar.gz)
md5sums=('12f0a13a65359260585360341ed753ee')

build() {
  cd "$srcdir"/${pkgname^k}-$pkgver
  sed -i "s-/usr/local/share/$pkgname-/usr/share/pixmaps-" setup.py
  python setup.py install --root="$pkgdir" || return 1
}
