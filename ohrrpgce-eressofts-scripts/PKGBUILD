# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=ohrrpgce-eressofts-scripts
pkgver=1.0
pkgrel=1
pkgdesc="A big package of HamsterSpeak plotscripts written by Paul 'Rinku' Eres"
arch=(any)
url="http://hamsterrepublic.com/ohrrpgce/Eressoft's_Free_Script_Package.html"
license=('GPL')
depends=('ohrrpgce')
makedepends=('unzip')
source=(http://hamsterrepublic.com/ohrrpgce/thirdparty/eresscript.zip)

build() {
  cd "$srcdir"
	mkdir -p "${pkgdir}/usr/share/ohrrpgce/import/Scripts"
	mkdir -p "${pkgdir}/usr/share/doc/ohrrpgce"
	cp scripts.hs "${pkgdir}/usr/share/ohrrpgce/import/Scripts/erresoft.hs"
	cp scripts.!hs "${pkgdir}/usr/share/ohrrpgce/import/Scripts/erresoft.!hs"
	cp scripts.txt "${pkgdir}/usr/share/doc/ohrrpgce/eressoft-help"
}
# vim:set ts=2 sw=2 et:
md5sums=('ea4dddc0d80a9c74e9a8edd3a20310f7')
