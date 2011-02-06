# Contributor: Vamp898 <vamp898@web.de>
pkgname=fillmore
pkgver=0.1.0
pkgrel=4
pkgdesc="Multitrack audio recorder for GNOME"
arch=('i686' 'x86_64')
url="http://yorba.org/fillmore/"
license=('GPL')
depends=('gnonlin' 'libgee' 'gtk2')
makedepends=('vala>=0.9.1')
source=(http://yorba.org/download/media/0.1/$pkgname-lombard-$pkgver.tar.bz2)

build() {
  cd "$srcdir/media-$pkgver"

  ./configure --prefix=/usr/bin
  CFLAGS="${CFLAGS} -fPIC" make fillmore|| return 1
  make DESTDIR="$pkgdir/" install-fillmore
}
md5sums=('ac2d7d1549f7230853b3539bcd362eb8')
