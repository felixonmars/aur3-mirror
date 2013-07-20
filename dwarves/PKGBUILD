pkgname=dwarves
pkgver=1.10
pkgrel=1
pkgdesc="Debugging Information Manipulation Tools"
arch=('i686' 'x86_64')
url="http://acmel.wordpress.com"
license=('GPL2')
depends=('elfutils') # libelf.so libdw.so libebl.a
makedepends=('cmake')
source=("http://fedorapeople.org/~acme/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('4a9c508f9343d057d00599e05fdb4ee5')
sha256sums=('557306e1b58b475f689f44095ec62388877b1a8dd06174f97e309994c15bcc14')

build() {
	cd "$srcdir"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DLIB_INSTALL_DIR=/usr/lib
}

package() {
	cd "$srcdir"
	make DESTDIR="$pkgdir/" install
}
