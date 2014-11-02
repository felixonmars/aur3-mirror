# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: JohannesSM64 <johannes.a.langoy@gmail.com>
pkgname=jupp
pkgver=3.1jupp28
pkgrel=1
pkgdesc="An enhanced, portable version of joe, forked in 2004."
url="https://mirbsd.org/jupp.htm"
license=('custom:GPLv1')
depends=('glibc' 'ncurses')
arch=('i686' 'x86_64')
conflicts=('joe')
source=("http://www.mirbsd.org/MirOS/dist/jupp/joe-$pkgver.tgz")

md5sums=('74b7b4033bc7ae38bc570c122c5b680b')
sha256sums=('be4d16cb44f002a3f6f5069471096c53d9c184b7366ef1a055422d2f0006851f')

backup=('etc/joe/jupprc' 
        'etc/joe/joerc' 
	'etc/joe/jmacsrc'
	'etc/joe/rjoerc'
	'etc/joe/jstarrc'
	'etc/joe/jpicorc')

build() {
	cd "$srcdir/$pkgname"
	
	sh configure --prefix=/usr --sysconfdir=/etc \
	             --disable-dependency-tracking --disable-termidx
	make
}

package() {
	cd "$srcdir/$pkgname"
	make "DESTDIR=$pkgdir" install
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
