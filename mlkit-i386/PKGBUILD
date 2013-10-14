# Maintainer : perlawk

pkgname=mlkit-i386
_pkgname=mlkit
pkgver=4.3.6
pkgrel=1
pkgdesc="The MLKit is a compiler for the programming language Standard ML. The MLKit covers all of Standard ML, and supports most of the Standard ML Basis Library."

url="http://www.itu.dk/research/mlkit/index.php/Main_Page"
license=('BSD' 'MIT' 'LGPL')
depends=('bash' )
makedepends=()
conflicts=()
replaces=()
backup=()
arch=(i686 x86_64)
install=mlkit.install
source=("http://netcologne.dl.sourceforge.net/project/mlkit/mlkit-4.3.6/mlkit-4.3.6-i386.tgz")

build() {
	cd "$srcdir/$_pkgname-$pkgver-i386"
}

package() {
	cd "$srcdir/$_pkgname-$pkgver-i386"
	mkdir -p "$pkgdir/usr"
	cp -a * "$pkgdir/usr"
}

md5sums=('64852ce997a812d0b7bf194c92764f0b')
