
# Contributor: MIZUNO J.Y. <http://p.mjy.name/>
pkgname=xpointer
pkgver=1.1
pkgrel=1
pkgdesc="Moves X pointer or displays the present location of X pointer"
arch=('i686' 'x86_64')
url="http://p.mjy.name/pro:xpointer-c"
license=('MIT')
groups=()
depends=('libx11')
makedepends=('libx11')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('http://p.mjy.name/local--files/pro:xpointer-c/xpointer-1.1.tar.bz2')
noextract=()
md5sums=('b6758a191456dd8d5aefa7d5e963bc88')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  #make GCC_OPT="-O3 -march=$arch" || return 1
  make GCC_OPT="$CFLAGS" || return 1
  make DESTDIR="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
