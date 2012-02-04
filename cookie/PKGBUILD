pkgname=cookie
pkgver=0.2
pkgrel=1
pkgdesc="Cookie is an AI secretary application"
arch=('i686' 'x86_64')
url="http://onebluecat.net/cookie"
license=('GPL')
install=cookie.install
depends=()
makedepends=('make')
provides=('cookie')
conflicts=('cookie')
source=()
md5sums=()

build() {
	wget $url/cookie-src_0.2.tar.gz -O $srcdir/cookie-src_0.2.tar.gz
	wget $url/aitools-src_0.2.tar.gz -O $srcdir/aitools-src_0.2.tar.gz

	tar xf $srcdir/aitools-src_0.2.tar.gz
	tar xf $srcdir/cookie-src_0.2.tar.gz

	mkdir -p $pkgdir/usr/include/aitools
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/etc/aitools

	cd $srcdir/aitools; make
	install $srcdir/aitools/aitools.h $pkgdir/usr/include/aitools/aitools.h
	install $srcdir/aitools/libaitools.a $pkgdir/usr/include/aitools/libaitools.a
	
	echo "CC cookie.c"
	cd $srcdir/ai; gcc -g -O2 --std=c99 -Wall cookie.c -o cookie -I$pkgdir/usr/include/aitools -L$pkgdir/usr/include/aitools -laitools
	install -m 755 $srcdir/ai/cookie $pkgdir/usr/bin/cookie
	chmod +x $pkgdir/usr/bin/cookie
	chown -R $USER $pkgdir/etc/aitools
}
