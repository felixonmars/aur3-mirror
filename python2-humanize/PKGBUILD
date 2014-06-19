# Maintainer: Alexander Duscheleit <jinks@archlinux.us>
_pkgname=humanize
pkgname=python2-${_pkgname}
pkgver=0.5
pkgrel=1
pkgdesc="python humanize utilities"
arch=('any')
url="http://pypi.python.org/pypi/humanize"
license=('MIT')
depends=('python2')
source=(http://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-$pkgver.tar.gz)
md5sums=('2f00150400ae6a6e0e9767c18a3147cd')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"

  python2 setup.py install --root=$pkgdir --optimize=1
}

# vim:set ts=2 sw=2 et:
