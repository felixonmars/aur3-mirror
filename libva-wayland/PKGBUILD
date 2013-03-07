# Maintainer : Armin K. <krejzi at email dot com>

pkgname=libva-wayland
pkgver=1.1.0
pkgrel=1
pkgdesc="Video Acceleration (VA) API for Linux"
arch=('i686' 'x86_64')
url="http://freedesktop.org/wiki/Software/vaapi"
license=('MIT')
depends=('libegl' 'libgl' 'libdrm' 'libxfixes' 'wayland')
makedepends=('mesa')
optdepends=('libva-intel-driver-wayland: back-end for Intel cards')
provides=('libva')
conflicts=('libva')
options=('!libtool')
source=("http://www.freedesktop.org/software/vaapi/releases/libva/libva-$pkgver.tar.bz2"
        "wayland.patch::http://cgit.freedesktop.org/vaapi/libva/patch/?id=b1cf861a087234eb797c402040403a538adbe0cc")
sha1sums=('af6e912ea86a6378992f5783390ab9cb8e5cadf9'
          '45e86eef6dc24baed81c47114f6c6cc4a4bab7ba')

build() {
  cd "$srcdir/libva-$pkgver"

  patch -Np1 -i "$srcdir/wayland.patch"
  sed "s@AM_CONFIG_HEADER@AC_CONFIG_HEADERS@g" -i configure.ac

  autoreconf -fi

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/libva-$pkgver"
  make DESTDIR="$pkgdir" install
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
