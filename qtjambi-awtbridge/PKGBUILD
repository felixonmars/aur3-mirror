#Maintainer "flying sheep" <flying-sheep@web.de>

pkgname=qtjambi-awtbridge
pkgver=20120531
pkgrel=1

arch=('i686' 'x86_64')
if [[ $CARCH == x86_64 ]]; then
	_arch=linux64
else
	_arch=linux32
fi

pkgdesc="AWT bridge for Qt Jambi"
url='http://qt-jambi.org/'
license=('GPL')

source=("http://unofficial.qt-jambi.org/$pkgname-$_arch-gcc-$pkgver-dist.tar.gz")
sha1sums=('f69dec62379927483872ed168074cef059cea9d4')

depends=('qtjambi>=4.8.5_beta1')

package() {
	cd "$srcdir"
	
	for jar in $pkgname-*.jar; do
		install -Dm644 "$jar" "$pkgdir/usr/share/java/$jar"
	done
}