# Maintainer: Rolinh <robinDOThahlingATgw-computingDOTnet>
pkgname=python2-dotconf
pkgver=1.8
pkgrel=1
pkgdesc='Advanced configuration parser for Python'
arch=('any')
url='http://pypi.python.org/pypi/dotconf/'
license=('MIT')
depends=('python2' 'python2-ply')
source=(http://pypi.python.org/packages/source/d/dotconf/dotconf-${pkgver}.tar.gz)
md5sums=('6a264ad91089c4cd6dd9801358066412')

package() {
  cd dotconf-${pkgver}

  python2 setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 ft=sh et:
