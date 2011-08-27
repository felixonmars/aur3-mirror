# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=dosdetector
pkgver=current
pkgrel=1
pkgdesc="analyze and detect suspicious traffic from IP and alert about it. "
arch=('i686' 'x86_64')
url="http://darkzone.ma.cx/resources/unix/dosdetector"
license=('BSD')
depends=('ncurses' 'libpcap')
source=(http://darkzone.ma.cx/resources/unix/dosdetector/download.php?file=$pkgname-$pkgver.tar.gz)
md5sums=('ac37a3242ad6fee1a0576bcf2845bcfe') 

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr 
  make || return 1
  make bindir=$pkgdir/usr/bin mandir=$pkgdir/usr/share/man install
install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
