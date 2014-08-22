# Maintainer: Francesco Marella <francesco.marella@anche.no>

pkgname=textadept-modules
pkgver=7.5
pkgrel=1
pkgdesc="A fast, minimalist, and ridiculously extensible cross-platform text editor. - Modules"
arch=('any')
url="http://foicica.com/textadept"
license=('MIT')
depends=('textadept-latest-stable')
source=("http://foicica.com/textadept/download/textadept_${pkgver}.modules.zip")
md5sums=('aefe921d05e147970d431047faedc6b9')

package() {
	cd ${srcdir}/textadept_${pkgver}.modules
	mkdir -p ${pkgdir}/usr/share/textadept/modules
	cp -R modules/* ${pkgdir}/usr/share/textadept/modules
	rm -rf `find ${pkgdir} -type d -name .hg`
}
