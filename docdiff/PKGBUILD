# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=docdiff
pkgver=0.4.0
pkgrel=1
pkgdesc='A tool to compare two text files and shows the difference'
arch=('any')
url="http://docdiff.sourceforge.net/"
license=('BSD')
depends=('ruby')
source=("http://jaist.dl.sourceforge.net/project/docdiff/docdiff/${pkgver}/docdiff-${pkgver}.tar.gz")

package() {
	cd "${srcdir}/docdiff-${pkgver}"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	sed -n '/Copyright (C)/,/ DAMAGE./p' readme.en.html > LICENSE
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('c9c7f559aa9c9c07c6ae342e579b4142')
