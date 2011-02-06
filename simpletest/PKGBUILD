# Contributor: Jakub Vitak <mainiak@gmail.com>
pkgname="simpletest"
pkgver="1.0.1"
pkgrel=2
pkgdesc="SimpleTest PHP unit tester"
arch=('i686' 'x86_64')
url="http://simpletest.org"
license=('LGPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://downloads.sourceforge.net/sourceforge/simpletest/${pkgname}_${pkgver}.tar.gz")
noextract=()
md5sums=('ab70ef7617b37a933499a630890461da')

build() {
  _dest="$pkgdir/srv/http"
  mkdir -p $_dest
  mv "$srcdir/$pkgname" $_dest/
}

# vim:set ts=2 sw=2 et:
