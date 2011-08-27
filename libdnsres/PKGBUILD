# Contributor: Tom K <tomk@runbox.com>

pkgname=libdnsres
pkgver=0.1a
pkgrel=1
pkgdesc="a non-blocking DNS resolver library"
depends=('glibc')
source=(http://www.monkey.org/~provos/libdnsres-0.1a.tar.gz)
md5sums=('069cc39d7ddf85c9be9ada679d5363c2')
url="http://www.monkey.org/~provos/libdnsres/"
arch=('i686')
license="BSD"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
  install -D LICENSE $startdir/pkg/usr/share/licenses/libdnsres/LICENSE
}
