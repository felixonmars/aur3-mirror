# Maintainer: Robin Appelman <robin@icewind.nl>

pkgname=php-memprof
_extname=memprof
pkgver=1.0.0
pkgrel=1
pkgdesc='Memory profiling for php scripts'
arch=('any')
url='https://github.com/arnaud-lb/php-memory-profiler'
license=('MIT')
depends=('judy')
makedepends=('php')
source=("https://github.com/arnaud-lb/php-memory-profiler/archive/1.0.0.tar.gz")
md5sums=('d2a152ab542c521683c3adc7788f1c95')

build() {
  cd "php-memory-profiler-$pkgver"
  phpize
  ./configure
  make
}

package() {
  cd "php-memory-profiler-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
  echo "extension=$_extname.so" > $_extname.ini
  install -D -m644 $_extname.ini "$pkgdir/etc/php/conf.d/$_extname.ini"
}
