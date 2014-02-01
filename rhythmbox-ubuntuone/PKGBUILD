# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=rhythmbox-ubuntuone
pkgver=13.10
pkgrel=1
pkgdesc="A Rhythmbox plugin that integrates Ubuntu One features"
arch=('any')
url="https://launchpad.net/rhythmbox-ubuntuone"
license=('GPL')
depends=('rhythmbox')
makedepends=('python2-distutils-extra')
install=$pkgname.install
source=(https://launchpad.net/rhythmbox-ubuntuone/stable-13-10/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('71be9cc0557a2f42efc9d0e66aef795e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1
}
