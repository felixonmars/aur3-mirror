
# Maintainer: Luca Fulchir <luca@fulchir.it>

pkgname=proverif-doc
realpkgname=proverifdoc
compressedname=proverif
pkgver=1.89
pkgrel=1
pkgdesc="ProVerif documentation"
depends=('proverif')
arch=('any')
url="http://prosecco.gforge.inria.fr/personal/bblanche/proverif/"

license=('GPL')
source=(http://prosecco.gforge.inria.fr/personal/bblanche/proverif/${realpkgname}$pkgver.tar.gz)
md5sums=('f5c7e28f6dfc7423716187c93c6e93dd')
sha1sums=('9cb6c5185991685bdc73f687f2493a03356877cf')
sha256sums=('83b2d76dd81f4b2498689af520d20c0eb35d838b2aeb9aee66d4afaf3b179b74')

package() {
	cd "$srcdir/$compressedname$pkgver"
	mkdir -p $pkgdir/usr/share/doc/proverif
	cp -a docs $pkgdir/usr/share/doc/proverif
}


