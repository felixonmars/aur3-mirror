# Maintainer: Rolinh <robinDOThahlingATgw-computingDOTnet>
pkgname=python-dotconf
pkgver=1.8
pkgrel=1
pkgdesc='Advanced configuration parser for Python'
arch=('any')
url='http://pypi.python.org/pypi/dotconf/'
license=('MIT')
depends=('python' 'python-ply')
source=(http://pypi.python.org/packages/source/d/dotconf/dotconf-${pkgver}.tar.gz)
md5sums=('6a264ad91089c4cd6dd9801358066412')

package() {
  cd dotconf-${pkgver}

  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 ft=sh et:
