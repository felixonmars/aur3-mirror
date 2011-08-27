# Maintainer:  Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=dvisvg
pkgver=0.7.1
pkgrel=5
arch=('i686' 'x86_64')
pkgdesc="A program for converting from DVI to SVG."
url="http://dvisvg.sourceforge.net/"
license=('GPL')
depends=('glibc' 'texlive-core')
source=(http://${pkgname}.sourceforge.net/files/${pkgname}-${pkgver}d.tar.gz)
md5sums=('e39da0063a4f8298060a2ba484d88eb1')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make
}
package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -d ${pkgdir}/usr/{bin,share/man/man1} 
	make TARGETDIR=${pkgdir}/usr BINDIR=${pkgdir}/usr/bin MANDIR=${pkgdir}/usr/share/man/man1 CNFDIR=${pkgdir}/usr/share/${pkgname} install 
}
