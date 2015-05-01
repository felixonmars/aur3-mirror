pkgname=m-ping
pkgver=0.4
pkgrel=1
pkgdesc="qt gui for ping"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/m-ping/"
license=('GPL')
depends=('qt4')
makedepends=()
source=(http://vorboss.dl.sourceforge.net/project/m-ping/m-ping/m-ping-$pkgver/m-ping-$pkgver.tar.gz)
md5sums=('d762210ee7bbf1c79efc0b57db3953ec')

build() {
	cd "$pkgname-$pkgver"
	qmake-qt4 -o Makefile m-ping.pro
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 bin/m-ping $pkgdir/usr/bin/m-ping
}
