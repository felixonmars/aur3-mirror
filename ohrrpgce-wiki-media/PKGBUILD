# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=ohrrpgce-wiki-media
pkgver=20101114
pkgrel=1
pkgdesc="Free stuff that can be used in your games from the wiki"
arch=(any)
url="http://hamsterrepublic.com/ohrrpgce/Main_Page.html"
license=('GPL')
depends=('ohrrpgce')
source=(http://huulivoide.pp.fi/Arch/$pkgname-$pkgver.tar.xz)

build() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/ohrrpgce/import/"
	cp -r media/* "${pkgdir}/usr/share/ohrrpgce/import/"
}
# vim:set ts=2 sw=2 et:
md5sums=('2d5bf9c6e7d44b4fa34629395f950450')
