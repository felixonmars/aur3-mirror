#Maintainer: Nathan O <ndowens04 at gmail dot com>

pkgname=libgiigic
pkgver=1.1.2
pkgrel=1
pkgdesc="GII high-level key binding support"
arch=('i686' 'x86_64')
url="http://www.ggi-project.org/"
license=("MIT")
depends=('libgii')
options=("!libtool")
source=("http://downloads.sourceforge.net/ggi/$pkgname-$pkgver.src.tar.bz2" "LICENSE")
md5sums=('bac6241c96f706f7b97246d84c95220a' '76299c9337a881c385af535626deb928')

build() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/share/licenses/$pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make || return 1
  make DESTDIR=$pkgdir install
  install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
