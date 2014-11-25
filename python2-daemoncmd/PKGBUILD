# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Preston Ma<pentie [at] gmail.com>
pkgname=python2-daemoncmd
pkgver=0.2.0
pkgrel=1
pkgdesc="Turn any command line into a daemon with a pidfile and start, stop, restart, and status commands."
arch=(any)
url="http://pypi.python.org/pypi/daemoncmd/"
license=('MIT')
groups=()
depends=('python2')
makedepends=('python2-distribute')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://pypi.python.org/packages/source/d/daemoncmd/daemoncmd-$pkgver.tar.gz")

package() {
  cd "$srcdir/daemoncmd-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
md5sums=('8fbbf65651f026c93e155c5413cc3e2b')
