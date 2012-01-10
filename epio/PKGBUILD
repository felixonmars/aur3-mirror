# Maintainer: pisuka <tekmon@gmail.com>
pkgname=epio
pkgver=0.3.1
pkgrel=1
pkgdesc="The command-line client for the ep.io service"
arch=(any)
url="https://www.ep.io/docs/client/"
license=(unknown)
groups=()
depends=(python2-httplib2)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/e/epio/epio-$pkgver.tar.gz)
md5sums=(0edec64e5ea1b90d31a22b25d587b3c0)

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
