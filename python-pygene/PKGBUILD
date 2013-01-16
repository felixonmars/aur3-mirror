# Maintainer: TDY <tdy@archlinux.info>

pkgname=python-pygene
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple genetic algorithms/programming library for Python"
arch=('any')
url="http://freenet.mcnabhosting.com/python/pygene/"
license=('GPL')
depends=('python2')
source=(http://freenet.mcnabhosting.com/python/${pkgname/*-}/${pkgname/*-}-$pkgver.tar.gz)
md5sums=('196672b7421b0e35d096b81bec7a57eb')

build() {
  cd "$srcdir/${pkgname/*-}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname/*-}-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
