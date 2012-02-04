# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=okindd
pkgver=0.6
pkgrel=1
epoch=
pkgdesc="OSD For Qt"
arch=('x86_64' 'i686')
url="http://sites.kochkin.org/okindd/Home"
license=('GPL')
groups=()
depends=(qt)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('http://sites.kochkin.org/okindd/Home/development/okindd-0.6.0-49-20110113.tar.bz2?attredirects=0&d=1')
noextract=()
md5sums=('61933f041ac1612f38817460527ee5a7')

build() {
  cd "$srcdir/$pkgname"
  qmake
  make
}

check() {
  cd "$srcdir/$pkgname"
  make -k check
}

package() {
  #cd "$srcdir/$pkgname"
  #make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/bin/"
  install "$srcdir/$pkgname/bin/okindd" "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
