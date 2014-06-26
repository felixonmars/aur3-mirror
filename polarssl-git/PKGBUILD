# Maintainer: Luka Perkov <luka.perkov@sartura.hr>

pkgname=polarssl-git
_gitname=polarssl
pkgver=r2242.47431b6
pkgrel=1
pkgdesc='Portable cryptographic and SSL/TLS library'
url='http://www.polarssl.org/'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('zlib')
makedepends=('git' 'cmake' 'gcc')
provides=('polarssl')
conflicts=('polarssl')
source=('git+https://github.com/polarssl/polarssl.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"

	cmake . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_PKCS11_HELPER_LIBRARY=OFF \
		-DENABLE_ZLIB_SUPPORT=ON \
		-DENABLE_PROGRAMS=OFF \
		-DUSE_SHARED_POLARSSL_LIBRARY=ON \

	make
}

package() {
	cd "$srcdir/$_gitname"

	make DESTDIR="$pkgdir" install
}
