# Maintainer: Renan Birck <renan.ee.ufsm@gmail.com>

pkgname=xmodconfig
pkgver=0.2.0
_realpkgver=0.2.0-beta
pkgrel=1
pkgdesc="A graphical front-end for xmodmap"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/xmodconfig/"
license=('GPL')
groups=()
depends=('xorg-server-utils' 'qt')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://downloads.sourceforge.net/sourceforge/xmodconfig/$pkgver/$pkgname-$_realpkgver.tar.gz)
noextract=()
md5sums=('4a34bc2917376e51a34d553d86adcbe5')

build() {
  cd "$srcdir/$pkgname-$_realpkgver"
  qmake PREFIX=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$_realpkgver"
  make INSTALL_ROOT="$pkgdir" install || return 1
}

# vim:set ts=2 sw=2 et:
