# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=mugo
pkgver=1.1.3
pkgrel=1
pkgdesc='SGF editor written by C++ and Qt'
arch=('i686')
url="http://code.google.com/p/mugo/"
license=('GPL3')
depends=('phonon' 'qt4')
source=("http://mugo.googlecode.com/files/mugo_${pkgver}-1_i386.deb")

package() {
	cd "${srcdir}"
	ar p mugo_${pkgver}-1_i386.deb data.tar.gz | tar zx
	install -Dm755 "${srcdir}/usr/games/mugo" "${pkgdir}/usr/bin/mugo"
	mkdir "${pkgdir}/usr/share"
	cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
}

md5sums=('3a8c48cb99d0c6cf9f8e0331f50f2f11')
