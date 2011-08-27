# Contributor: Vamp898 <vamp898@web.de>
pkgname=lombard
pkgver=0.1.0
pkgrel=1
pkgdesc="Video editor for GNOME"
arch=('i686' 'x86_64')
url="http://yorba.org/lombard/"
license=('GPL')
depends=('gnonlin' 'libgee' 'gtk2')
makedepends=('vala>=0.9.1')
source=(http://yorba.org/download/media/0.1/fillmore-$pkgname-$pkgver.tar.bz2)

build() {
  cd "$srcdir/media-$pkgver"

  ./configure --prefix=/usr/bin
  make lombard|| return 1
  make DESTDIR="$pkgdir/" install-lombard
}
md5sums=('ac2d7d1549f7230853b3539bcd362eb8')
