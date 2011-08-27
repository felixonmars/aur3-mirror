# Contributor: Brian Davis <brian.william.davis@gmail.com>

pkgname=hum
pkgver=0.2.1
pkgrel=1
pkgdesc="The low calorie music manager"
arch=('i686' 'x86_64')
url="http://monodeldiablo.github.com/hum"
license=('GPL')
depends=('tracker' 'gtk2' 'gstreamer0.10')
makedepends=('make' 'intltool>=0.35' 'pkgconfig>=0.9')
source=(http://cloud.github.com/downloads/monodeldiablo/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('49af3ea887fc45101c0ea9fbb8012836')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr

  make || return 1
  make DESTDIR="$pkgdir" install
}
