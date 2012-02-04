# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jens Nyberg <jens.nyberg@gmail.com>
pkgname=dvdid
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="Utility to identify DVD identification numbers"
arch=('i686' 'x86_64')
url="http://www.srcf.ucam.org/~cjk32/dvdid/"
license=('GPL')
groupsdd=()
depends=()
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
source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('813603f07b33ba902d3546943f8df142')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
