# Maintainer: TDY <tdy@archlinux.info>

pkgname=python2-eeml
pkgver=4.1.0
pkgrel=1
pkgdesc="A Python package for generating eeml documents"
arch=('any')
url="http://petervizi.github.com/python-eeml/"
license=('GPL3')
depends=('python2-lxml')
makedepends=('python2-distribute')
source=($pkgname-$pkgver.tgz::https://github.com/petervizi/${pkgname/2}/archive/$pkgver.tar.gz)
sha256sums=('14be92b1e25a4846dab9b90d55c94a24277614ee4d0a98d4dcdba3ee5c631d2b')

build() {
  cd "$srcdir/${pkgname/2}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname/2}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
