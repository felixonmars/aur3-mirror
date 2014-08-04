pkgname=libnsfb
pkgver=0.1.1
pkgrel=1
pkgdesc='Framebuffer library for NetSurf'
arch=('x86_64' 'i686' 'armv7h')
url='http://www.netsurf-browser.org/'
license=('GPL')
source=("http://download.netsurf-browser.org/libs/releases/$pkgname-$pkgver-src.tar.gz")
md5sums=('0dbcde843575a662c771b83806906f48')
makedepends=(netsurf-buildsystem)
options=('staticlibs')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make  PREFIX=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install PREFIX=/usr LIBDIR="lib" DESTDIR="$pkgdir"
}

