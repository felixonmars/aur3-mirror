# Maintainer: pisuka <tekmon@gmail.com>
pkgname=python2-pyalsa
pkgver=1.0.26
pkgrel=2
pkgdesc="Python bindings for ALSA lib"
arch=(any)
url="http://alsa-project.org"
license=(LGPL GPL2)
groups=()
depends=(python2 alsa-lib)
makedepends=(gcc pyrex)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://alsa.cybermirror.org/pyalsa/pyalsa-$pkgver.tar.bz2)
md5sums=(a68a0749a878ba320ae82b0703d5b346)

package() {
  cd "$srcdir/pyalsa-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
