# Maintainer: Chris Chapman <chris at pentandra dot com>
pkgname=fntsample
pkgver=3.2
pkgrel=1
pkgdesc="A tool that can be used to make font samples similar to Unicode Charts."
arch=('i686' 'x86_64')
url="http://fntsample.sourceforge.net/"
license=('GPL3')
depends=('cairo' 'fontconfig' 'freetype2' 'glib' 'pango' 'perl-pdf-api2' 'perl-libintl-perl')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
        http://www.unicode.org/Public/UNIDATA/Blocks.txt)
md5sums=('0073844734ed244ff31d97e876da1455'
         'a19ba187f35cacacca2039bdd34871f0')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --with-unicode-blocks="$srcdir/Blocks.txt"
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
