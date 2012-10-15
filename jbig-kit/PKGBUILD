# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=jbig-kit
pkgver=2.0
pkgrel=2
pkgdesc="Software implementation of the JBIG1 data compression standard (ITU-T T.82), which was designed for bi-level high-resolution image data such as scanned documents. "
arch=('i686' 'x86_64')
url="http://www.cl.cam.ac.uk/~mgk25/jbigkit/"
license=('GPL')
depends=('glibc')
source=(
	"http://www.cl.cam.ac.uk/~mgk25/download/jbigkit-$pkgver.tar.gz"
	'jbigkit-2.0-shared.diff'
)
md5sums=(
	'3dd87f605abb1a97a22dc79d8b3e8f6c'
	'5f71d75ff1e21ed634599a4f700f6232'
)

build() {
	cd "$srcdir/jbigkit"
	patch -p1 < "$srcdir/jbigkit-2.0-shared.diff"
	make
}

check() {
	cd "$srcdir/jbigkit"
	make test
}

package() {
	cd "$srcdir/jbigkit"
	make DESTDIR="$pkgdir" prefix='/usr' libdir='/usr/lib' install
}
