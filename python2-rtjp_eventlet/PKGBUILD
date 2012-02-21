# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=python2-rtjp_eventlet
pkgver=0.3.2
pkgrel=1
pkgdesc="Simple RTJP implementation build on eventlet."
arch=('any')
url="http://pypi.python.org/pypi/rtjp_eventlet"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
provides=()
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/r/rtjp_eventlet/rtjp_eventlet-$pkgver.tar.gz")
md5sums=('3aa4d43bcce235d416e5bd5e99408f81')

package() {
  cd "$srcdir/rtjp_eventlet-$pkgver"
  python2 setup.py install --prefix=/usr --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:
