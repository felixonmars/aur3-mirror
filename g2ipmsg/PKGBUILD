# Contributed by: Figo.zhang <figo1802@gmail.com>


pkgname=g2ipmsg
pkgver=0.9.6
pkgrel=2
pkgdesc="Creator of padded cells for untrusted applications."
url="http://www.ipmsg.org/"
depends=(perl perlxml)
makedepends=(pkgconfig)
license=('Other')
conflicts=()
replaces=()
arch=(i686 x86_64)
install=
source=(http://www.ipmsg.org/archive/$pkgname-$pkgver.tar.gz)
md5sums=("676af5bda36ffe611fc73433cd346164")

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed 's/CP932/CP936/g' src/codeset.c > f;mv f src/codeset.c
  ./configure --prefix=/usr --sysconfdir=/etc --enable-systray
  make || return 1
  make DESTDIR=$startdir/pkg install
}
