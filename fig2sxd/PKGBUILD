# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=fig2sxd
pkgver=0.21
pkgrel=1
pkgdesc="A program to convert files in XFig format into OpenOffice.org Draw format"
arch=('i686' 'x86_64')
url="http://fig2sxd.sourceforge.net/"
license=('GPL')
depends=('gcc-libs' 'zlib')
source=("http://downloads.sourceforge.net/project/fig2sxd/fig2sxd/${pkgver}/fig2sxd_${pkgver}.orig.tar.gz")

build() {
	cd "${srcdir}/fig2sxd-${pkgver}"
	make
}

package() {
	cd "${srcdir}/fig2sxd-${pkgver}"
	make DESTDIR="${pkgdir}/usr" install
}

md5sums=('3e8a876d1473942ee1d22c0290c47eaa')
