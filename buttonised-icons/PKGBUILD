# Maintainer: Malina Salina <mali#archlinux>

pkgname=buttonised-icons
_pkgname=buttonised
pkgver=1.0
pkgrel=1
pkgdesc="Buttonised Icon theme. Pretty large package! (60-70Mb!)"
arch=('any')
url="http://www.noobslab.com/2013/11/buttonized-icons-updated-installed-in.html"
license=('GPL')
depends=()
optdepends=()
source=("http://goo.gl/cdgl09")
sha1sums=('f9b2917d319967af9b6b659c8867c24fd8577d01')

build() {
	cd ${srcdir}
	tar xvf data.tar.gz 
	}

package() {
	ls   
mkdir -p "${pkgdir}/usr/share/icons"
mkdir -p "${pkgdir}/usr/share/doc"
	mv ${srcdir}/usr/share/icons/buttonized "${pkgdir}/usr/share/icons/buttonised"
    mv ${srcdir}/usr/share/doc/buttonized-icons "${pkgdir}/usr/share/doc/buttonised-icons"
	chmod -R 755 "${pkgdir}/usr/share/"
}

# vim:set ts=2 sw=2 et:
