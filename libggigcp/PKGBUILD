#Maintainer: Nathan O <ndowens04 at gmail
pkgname=libggigcp
pkgver=1.0.2
pkgrel=1
pkgdesc="GGI advanced color and palette handling"
url="http://www.ggi-project.org/"
license=("MIT")
arch=('i686' 'x86_64')
depends=('libggi')
options=('!libtool')
source=("http://downloads.sourceforge.net/ggi/$pkgname-$pkgver.src.tar.bz2" "LICENSE")
md5sums=('d8e8a5317db1e3aeac98338a2ad10c69' '76299c9337a881c385af535626deb928')

build() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/share/licenses/$pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make || return 1
  make DESTDIR=$pkgdir install
  install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
