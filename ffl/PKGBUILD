#Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
#Contributor: Nathan O <ndowens.aur at gmail dot com>
pkgname=ffl
pkgver=0.8.0
pkgrel=2
pkgdesc="The Forth Foundation Library (FFL) is a general library written in the forth language"
arch=('i686' 'x86_64')
url="http://code.google.com/p/${pkgname}"
license=('GPL2')
source=("http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('c754d58e7b6612d35909a65e17de3a28')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -d ${pkgdir}/usr/share/gforth/site-forth/ffl/
	install -Dm644 ffl/* ${pkgdir}/usr/share/gforth/site-forth/ffl/
}
# vim:set ts=2 sw=2 et:
