# Contributor: lp76 <l.peduto@gmail.com>
pkgname=surblhost
pkgver=0.8.0
pkgrel=1
pkgdesc="A small command-line program that looks up hostnames in the Spam URI Realtime Blocklists (SURBL)."
url="http://surblhost.sourceforge.net/"
license="GPL"
depends=()
arch=(i686)
install=
source=(http://dl.sourceforge.net/sourceforge/surblhost/$pkgname-$pkgver.tar.gz)
md5sums=('24645f08310a00204b35963032b9f759')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install
}
