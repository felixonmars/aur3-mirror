# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=iiview
pkgver=0.28
pkgrel=1
pkgdesc='An application to display pictures in a directory as thumbnails'
arch=('i686' 'x86_64')
url="http://iiview.sourceforge.net/"
license=('BSD')
depends=('libjpeg-turbo' 'libpng' 'libtiff' 'libx11')
source=("http://downloads.sourceforge.net/project/iiview/iiview/${pkgver}/iiview-${pkgver}.tar.bz2")

build() {
	cd "${srcdir}/iiview-${pkgver}"
	make
}

package() {
	cd "${srcdir}/iiview-${pkgver}"
	install -Dm755 bin/iiview "${pkgdir}/usr/bin/iiview"
	install -Dm644 man/src/iiview.1 "${pkgdir}/usr/share/man/man1/iiview.1"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('08b184de48cf02022a67e52d4ada2944')
