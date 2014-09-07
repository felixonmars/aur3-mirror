# Maintainer: Paul Colomiets <pc@gafol.net>

pkgname=coyaml
pkgver=0.3.14
pkgrel=2
pkgdesc="A configuration file parser generator"
arch=('i686' 'x86_64')
url="http://github.com/tailhook/coyaml"
license=('MIT')
depends=('libyaml')
makedepends=('python' 'python-yaml')
source=(https://github.com/downloads/tailhook/coyaml/$pkgname-$pkgver.tar.bz2)
md5sums=('9b19d4b4a8d8942ff00b7fc7c1ea5376')
options=(staticlibs)

build() {
  cd $srcdir/$pkgname-$pkgver
  ./waf configure --prefix=/usr
  ./waf build
}

check() {
  cd $srcdir/$pkgname-$pkgver
  ./waf test
}

package() {
  cd $srcdir/$pkgname-$pkgver
  ./waf install --destdir=$pkgdir
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
