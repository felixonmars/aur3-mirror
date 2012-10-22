# Maintainer: AlexanderR <alexander r at gmx com>
pkgname=xf86-video-sis671
pkgver=0.10.7
pkgrel=1
pkgdesc="SiS 671 video driver (derivate of xf86-sisimedia, latest tested version). Module name is 'sisimedia'."
arch=('i686' 'x86_64')
url="https://gitorious.org/$pkgname"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel>=1.11.0' 'xf86dgaproto' 'libdrm' 'xf86driproto' 'mesa' 'glproto' 'resourceproto')
provides=('xf86-video-sisimedia')
conflicts=('xorg-server<1.13.0' 'xf86-video-sisimedia')
install=driver.install
options=('!libtool')
source=("https://gitorious.org/$pkgname/sis-671-fix/archive-tarball/$pkgver")

build() {
  cd "$srcdir/$pkgname-sis-671-fix"

  autoreconf -vi
  ./configure --prefix=/usr --disable-static \
	--disable-dri # it have never worked, just avoid warnings
  make
}

package() {
  cd "$srcdir/$pkgname-sis-671-fix"

  make DESTDIR="$pkgdir/" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

sha256sums=('84935285f31f43b658689e633d820bee1def6d7bc42adf79dece6dcf832308ed')
