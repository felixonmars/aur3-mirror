pkgname=pidgin-privacy-please
pkgver=0.7.1
pkgrel=1
pkgdesc="pidgin plugin to stop spammers from annoying you"
arch=(i686 x86_64)
url="http://freshmeat.net/projects/pidgin-pp"
license=('GPL')
depends=('pidgin' 'intltool')
source=(http://pidgin-privacy-please.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('f1fb3c46750eb026f81a74a6569d43b6')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure
  make
  make DESTDIR="$startdir/pkg" install
}