#Maintainer "flying sheep" <flying-sheep@web.de>

pkgname=qtjambi-beta-unofficial
_pkgname=qtjambi
_pkgver_main=4.8.5
_pkgver_beta=_beta1
pkgver=$_pkgver_main$_pkgver_beta
pkgrel=2

arch=('i686' 'x86_64')
if [[ $CARCH == x86_64 ]]; then
	_arch=linux64
else
	_arch=linux32
fi

pkgdesc="Java bindings for the Qt C++ toolkit."
url='http://qt-jambi.org/'
license=('GPL')

provides=("qtjambi=$pkgver")
conflicts=('qtjambi')

_filename="$_pkgname-$_pkgver_main-$_arch${_pkgver_beta/_/-}"
source=("http://unofficial.qt-jambi.org/$_filename.tar.xz")
sha1sums=('6a2294c833a1613fc9ea33255bdd13e90a305f40')

depends=("qt4>=$_pkgver_main" 'java-environment>=6' 'libpng15')

package() {
	cd "$srcdir/$_filename"
	
	for jar in qtjambi-*.jar; do
		install -Dm644 "$jar" "$pkgdir/usr/share/java/$jar"
	done
}