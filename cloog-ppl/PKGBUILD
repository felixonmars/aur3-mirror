# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=cloog-ppl
_pkgname=cloog-parma
pkgver=0.16.1
pkgrel=1
pkgdesc="Generating loops for scanning polyhedra."
arch=('i686' 'x86_64')
url="http://www.cloog.org"
license=('GPL')
depends=('gmp' 'ppl')
makedepends=('automake' 'autoconf' 'libtool')
source=("http://www.bastoul.net/cloog/pages/download/$_pkgname-$pkgver.tar.gz")
md5sums=('f483539b30a60a3478eea70c77b26bef')

build() {
	cd $srcdir/$_pkgname-$pkgver
	libtoolize -f
	aclocal
	automake -a --foreign
	autoconf
	./configure --with-bits=gmp --with-ppl=/usr --prefix=/usr --program-suffix=-ppl
	make
}

package() {
	cd $srcdir/$_pkgname-$pkgver
	make DESTDIR="$pkgdir" install
	rm -r $pkgdir/usr/include/cloog/*[!ppl]
}
