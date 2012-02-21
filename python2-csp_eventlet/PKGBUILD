# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=python2-csp_eventlet
pkgver=0.6.0
pkgrel=1
pkgdesc="An implemention of the Comet Session protocol specification for eventlet."
arch=('any')
url="http://pypi.python.org/pypi/csp_eventlet"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
provides=()
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/c/csp_eventlet/csp_eventlet-$pkgver.tar.gz")
md5sums=('7776914368278e11b8c6f5a6fb430f61')

package() {
  cd "$srcdir/csp_eventlet-$pkgver"
  python2 setup.py install --prefix=/usr --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:
