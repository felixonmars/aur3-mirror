# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=clog
pkgver=1.1.0
pkgrel=1
pkgdesc='A colorized log tail utility'
arch=('i686' 'x86_64')
url="http://tasktools.org/projects/clog.html"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake')
source=("http://taskwarrior.org/download/clog-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/clog-${pkgver}"
	cmake -D CMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "${srcdir}/clog-${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('5ebe5e0df20f794dbf5c5d75e9a56bae')
