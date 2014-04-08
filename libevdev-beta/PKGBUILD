
# Maintainer: Vincent Ambo <tazjin@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=libevdev-beta
pkgver=1.0.99.2
pkgrel=1
pkgdesc="Beta releases of wrapper library for evdev devices"
arch=(i686 x86_64)
url="http://www.freedesktop.org/wiki/Software/libevdev/"
license=(custom:X11)
depends=('glibc')
conflicts=('libevdev')
provides=('libevdev')
makedepends=('python')
source=(http://freedesktop.org/software/libevdev/libevdev-$pkgver.tar.xz)
sha256sums=('691d8dd2f1c62398d1467a6d67f2319c3e5c609301a6220c1dbf513ccab268d1')

build() {
  cd libevdev-$pkgver
  ./configure --prefix=/usr \
    --disable-static
  make
}

package() {
  cd libevdev-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
