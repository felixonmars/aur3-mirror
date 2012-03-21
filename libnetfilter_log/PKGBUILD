# Maintainer: Andrzej Boreczko <0rion@wp.pl>
pkgname=libnetfilter_log
pkgver=1.0.1
pkgrel=1
pkgdesc="netfilter userspace packet logging library"
arch=('i686' 'x86_64')
license="GPL"
depends=(libnfnetlink)
url="http://www.netfilter.org/projects/libnetfilter_log/index.html"
source=(http://www.netfilter.org/projects/$pkgname/files/$pkgname-$pkgver.tar.bz2)
md5sums=('2a4bb0654ae675a52d2e8d1c06090b94')


build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
