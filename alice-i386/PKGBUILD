#maintainer: perlawk

pkgname=alice-i386
_pkgname=alice
pkgver=1.4
_pkgver=1.4-1
pkgrel=2
pkgdesc="Alice ML is a functional programming language based on Standard ML, extended with rich support for concurrent, distributed, and constraint programming."

url="http://www.ps.uni-saarland.de/alice/"
license=('GPL')
arch=('i686' 'x86_64')
if [ $CARCH = x86_64 ] ; then
	depends=('lib32-gmp' 'lib32-sqlite' 'lib32-expat' 'lib32-libxml2' 'lib32-libgnomecanvas' 'lib32-gecode')
else 
	depends=('libgmp' 'libsqlite' 'libexpat' 'libxml2' 'liblibgnomecanvas' 'libgecode')
fi
makedepends=()
conflicts=()
replaces=()
backup=()
install=alice.install
source=( "http://www.ps.uni-saarland.de/alice/download/${_pkgname}-${_pkgver}.i386-linux.tgz")

build() {
	cd "$srcdir"
}

package() {
	#mkdir -p "$pkgdir"/usr
	#cd "$srcdir/opt/$_pkgname-$pkgver"
	#cp -a * "$pkgdir/usr"

	cd "$srcdir"
	cp -a opt "$pkgdir"

}
md5sums=('fe17ff34d7c01b4a45fc1361fee93ac4')
