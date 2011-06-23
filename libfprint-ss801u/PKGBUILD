# Maintainer: Liel Fridman <lielft@gmail.com>
pkgname=libfprint-ss801u
pkgver=0.4.0
pkgrel=1
pkgdesc="Library for fingerprint scanner support in applications, patched for the Egistec SS801U fingerprint reader."
arch=('any')
url="http://reactivated.net/fprint/wiki/Main_Page"
license=('GPL')
groups=()
depends=(glib2 imagemagick libusb-compat openssl)
makedepends=(git)
optdepends=()
provides=(libfprint)
conflicts=(libfprint)
replaces=(libfprint)
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

build() {
  git clone git://github.com/lielfr/Libfprint-for-Egistec-S801U.git $pkgname-$pkgver
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  mv $pkgdir/usr/etc $pkgdir/
}
