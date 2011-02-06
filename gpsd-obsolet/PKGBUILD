# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Your Name <youremail@domain.com>
pkgname=gpsd-obsolet
pkgver=2.39
pkgrel=1
pkgdesc="GPS daemon and library to support USB/serial GPS devices (old Version)"
arch=('i686' 'x86_64')
url="http://gpsd.berlios.de/"
license=('BSD')
groups=()
depends=('lesstif' 'libxaw' 'python>=2.6' 'pth' 'libusb')
makedepends=()
optdepends=()
provides=('gpsd')
conflicts=('gpsd')
replaces=()
backup=()
options=()
install=
source=(http://download.berlios.de/gpsd/gpsd-$pkgver.tar.gz)
noextract=()
md5sums=('3db437196a6840c252fca99b6c19d4d0') #generate with 'makepkg -g'

build() {
  cd "$srcdir/gpsd-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
