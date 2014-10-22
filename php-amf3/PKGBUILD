# Maintainer: Arseny Vakhrushev <arseny.vakhrushev@gmail.com>

pkgname=php-amf3
pkgver=1.2.3
pkgrel=1
pkgdesc="AMF3 encoding/decoding extension for the PHP programming language"
arch=('i686' 'x86_64')
url="http://neoxic.me/php-amf3/"
license=('MIT')
depends=('php')
backup=('etc/php/conf.d/amf3.ini')
source=(https://github.com/neoxic/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('67013f7858a0a9aaae338dbe041e2e32')

build() {
  cd "$pkgname-$pkgver"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  echo ';extension=amf3.so' > amf3.ini
  install -Dm644 amf3.ini "$pkgdir/etc/php/conf.d/amf3.ini"
}
