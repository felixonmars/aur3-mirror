# Contributor: Mathieu Grzybek <mathieu dot grzybek gmail com>

pkgname=halog
pkgver=1.4.22
pkgrel=1
pkgdesc="Log analyser for HA Proxy"
arch=('i686' 'x86_64')
url="http://haproxy.1wt.eu"
license=('GPL')
depends=()
makedepends=('gcc')
backup=()
source=("http://haproxy.1wt.eu/download/1.4/src/haproxy-$pkgver.tar.gz")
md5sums=('a0b007c76f6a78524f3b3dd5e704979c')


build() {
  cd "$srcdir/haproxy-$pkgver/contrib/halog"
  make
  install -D -m755 $srcdir/haproxy-$pkgver/contrib/halog/halog $pkgdir/usr/bin/halog
}
