#Maintainer: nado <nado@troglodyte.be>
#Contributor: squarezin <renanccastro@gmail.com>


pkgname=viewnior-wp
pkgver=1.1
pkgrel=4
pkgdesc="A simple, fast and elegant image viewer program with feh background support"
arch=('i686' 'x86_64')
url="http://xsisqox.github.com/Viewnior/"
license=('GPL3')
depends=('gtk2>=2.12' 'gconf')
makedepends=('make' 'intltool>=0.35' 'pkgconfig>=0.9' 'perl>=5.8.1')
provides=(viewnior)
conflicts=(viewnior)
install=viewnior.install
source=(http://cloud.github.com/downloads/xsisqox/Viewnior/viewnior-$pkgver.tar.gz)
md5sums=('5b14c6edaf78fdd3259f148ae9d7f062')

build() {
  cd "viewnior-$pkgver"
  LDFLAGS+=' -lm' ./configure --prefix=/usr --enable-wallpaper
  make
}

package() {
  cd "viewnior-$pkgver"
  make DESTDIR="$pkgdir" install
}
