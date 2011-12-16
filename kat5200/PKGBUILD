# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thomas Crescenzi <xsq1104 at aol dot com>
pkgname=kat5200
pkgver=0.6.2
pkgrel=1
epoch=
pkgdesc="an emulator for the Atari 5200 console and Atari 8-bit computers"
arch=(i686 x86_64)
url="http://kat5200.jillybunch.com/"
license=('GPL')
groups=()
depends=(zlib sdl sdl_image guichan)
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
source=(http://kat5200.googlecode.com/files/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('ca6f0244d0d8c24250e21685d647d633')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  env CPPFLAGS="-I/usr/include/SDL" ./configure --prefix=/usr
  make
  make prefix=$pkgdir/usr install
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
