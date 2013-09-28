# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=fpart
pkgver=0.9
pkgrel=1
pkgdesc='A tool that helps you sort file trees and pack them into bags'
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/fpart/"
license=('BSD')
source=("http://jaist.dl.sourceforge.net/project/fpart/fpart/fpart-${pkgver}/fpart-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/fpart-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/fpart-${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

md5sums=('c44fb9424731d1d0c52401f6c36673cd')