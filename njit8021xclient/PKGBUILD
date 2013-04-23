#Maintainer: a304yuan <a304yuanyuan@gmail.com>

pkgname=njit8021xclient
pkgver=1.3
pkgrel=1
pkgdesc="A 802.1x authentication client"
url="https://github.com/liuqun/njit8021xclient"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libpcap' 'openssl')
install="$pkgname.install"
source=("http://sourceforge.net/projects/njit8021xclient/files/njit8021xclient-$pkgver.tar.gz"
         "$pkgname.install")
md5sums=('1b19ac98ba90e18aff7aeefa431753e2'
         '5272644808988e7bd0a324069972814b')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make install DESTDIR="$pkgdir"

	install -Dm755 $pkgdir/usr/local/sbin/njit-client \
		$pkgdir/usr/bin/njit-client
	install -d $pkgdir/usr/share/doc/$pkgname
	cp ./*.html $pkgdir/usr/share/doc/$pkgname
#	install -Dm644 ./License/gpl-3.0.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

	rm -r $pkgdir/usr/local
}

	

	