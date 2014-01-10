# Maintainer: IshanArora (gmail)

pkgname=xrandr-align
pkgver=0.3.5
pkgrel=1
pkgdesc='A utility to keep the proper alignment between the screen and an X input device'
arch=('x86_64' 'i686')
url='http://wolneykien.github.io/xrandr-align'
license=('MIT/X11')
depends=('libx11' 'libxi' 'libxrandr' 'libxcb' 'libxext' 'libxrender' 'libxau' 'libxdmcp')
makedepends=()
source=("https://github.com/wolneykien/xrandr-align/archive/v$pkgver.tar.gz")
md5sums=('a39f0c8da55f559dc68b9f7992a7fbc4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
