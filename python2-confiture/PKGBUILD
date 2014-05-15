# Maintainer: Rolinh <robinDOThahlingATgw-computingDOTnet>
pkgname=python2-confiture
pkgver=2.0
pkgrel=1
pkgdesc='Advanced configuration parser for python'
arch=('any')
url='http://pypi.python.org/pypi/confiture/'
license=('MIT')
depends=('python2' 'python2-ply')
replaces=('python2-dotconf')
source=(http://pypi.python.org/packages/source/c/confiture/confiture-${pkgver}.tar.gz)
md5sums=('5b8fed73d08d51e9ae8e600418e5a821')

package() {
  cd confiture-${pkgver}

  python2 setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 ft=sh et:
