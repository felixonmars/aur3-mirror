# Maintainer: Armin K. <krejzi at email dot com>

pkgname=libva-intel-driver-wayland
pkgver=1.0.19
pkgrel=1
pkgdesc="VA-API implementation for Intel G45 chipsets and Intel HD Graphics for Intel Core processor family."
arch=('i686' 'x86_64')
url="http://freedesktop.org/wiki/Software/vaapi"
license=('MIT')
depends=('libva-wayland')
options=('!libtool')
provides=('libva-intel-driver')
conflicts=('libva-intel-driver')
replaces=('libva-driver-intel')
source=("http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver/libva-intel-driver-$pkgver.tar.bz2"
        "wayland.patch::http://cgit.freedesktop.org/vaapi/intel-driver/patch/?id=63db874e9c924f086bcd3518cc0f3d8c6df9ecec")
sha1sums=('9b1c92ca2b59b3b150fd45cb01775e0c114a41a7'
          '1b6ce97a583cdebfa46a6c35bfd5b9a1b2e47145')

build() {
  cd "$srcdir/libva-intel-driver-$pkgver"

  patch -Np1 -i "$srcdir/wayland.patch"
  sed "s@AM_CONFIG_HEADER@AC_CONFIG_HEADERS@g" -i configure.ac

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/libva-intel-driver-$pkgver"
  make DESTDIR="$pkgdir" install
  install -m644 -D COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
