# Maintainer: ajs124 < ajs124 DOT ajs124 ÄT gmail DOT .com >
# Contributor: Moritz Wilhelmy <moritz plus arch at wzff dot de>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=oftpd
pkgver=0.3.7
pkgrel=4
pkgdesc="A simple anonymous-only ftpd focused on security"
arch=('armv6h' 'i686' 'x86_64')
url="http://www.time-travellers.org/oftpd/"
license=('BSD')
source=(http://www.time-travellers.org/$pkgname/$pkgname-$pkgver.tar.gz
	$pkgname.conf
	$pkgname.rc
	$pkgname.service)
md5sums=('1a396ad12584c7efe3a0e712dadf28be'
	'693fb8453b4945dd41e5d643d9934070'
	'329689f843cddde34ec6ce8cc9274c4b'
	'e74f5a4bc840055cee020ad80bdd7ae1')
backup=("etc/conf.d/$pkgname")

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make bindir=$pkgdir/usr/bin mandir=$pkgdir/usr/share/man install
  
  install -Dm644 $srcdir/oftpd.conf    $pkgdir/etc/conf.d/oftpd
  install -Dm644 $srcdir/oftpd.service $pkgdir/usr/lib/systemd/system/oftpd.service
  install -Dm755 $srcdir/oftpd.rc      $pkgdir/etc/rc.d/oftpd  
}
