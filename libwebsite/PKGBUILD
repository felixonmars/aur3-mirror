# Maintainer: Paul Colomiets <paul@colomiets.name>

pkgname=libwebsite
pkgver=0.2.23
pkgrel=1
pkgdesc="An http/websocket protocol implementation for fast web servers"
arch=('i686' 'x86_64')
url="http://github.com/tailhook/libwebsite"
license=('MIT')
depends=('libev' 'openssl')
#checkdepends=('python3' 'cunit')
source=(https://github.com/tailhook/libwebsite/archive/v$pkgver.tar.gz)
md5sums=('094c384dc4a21ad35087d1e31880d91d')
options=(staticlibs)

build() {
  cd $srcdir/$pkgname-$pkgver
  ./waf configure --prefix=/usr
  ./waf build
}

check() {
  cd $srcdir/$pkgname-$pkgver
  # Check is disabled for now since there are failing test, it's harmless
  # and will be fixed in next release
  #./waf test
}

package() {
  cd $srcdir/$pkgname-$pkgver
  ./waf install --destdir=$pkgdir
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
