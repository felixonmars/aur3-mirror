# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: James Harrison <james@talkunafraid.co.uk>
pkgname=dvswitch
pkgver=0.8.3.6
pkgrel=2
epoch=
pkgdesc="A DV stream vision mixer and associated utilities"
arch=('i686' 'x86_64')
url="http://dvswitch.alioth.debian.org/wiki/"
license=('GPL')
groups=('multimedia')
depends=('boost' 'ffmpeg')
makedepends=('cmake' 'gtkmm')
checkdepends=()
optdepends=('dvgrab: dv capture from firewire devices')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('https://alioth.debian.org/frs/download.php/3615/dvswitch-0.8.3.6.tar.gz')
noextract=()
md5sums=('b88e2d5f6e83db6e7d3ee7472d09a2f2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir build && cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
