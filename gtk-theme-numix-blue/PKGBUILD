# Mantainer: DaLinuxCookie <cookie@openmailbox.org>

_themename=NumixBLUE
pkgname=gtk-theme-numix-blue
pkgver=2.0.2
pkgrel=1
pkgdesc="Blue version of the Numix theme (supports GTK 2, GTK 3, Xfwm and Openbox)"
arch=('any')
url="https://github.com/DaLinuxCookie/NumixBLUE"
license=('GPL3')
depends=('gtk-engine-murrine')
source=(https://github.com/DaLinuxCookie/${_themename}/archive/$pkgver.zip)
md5sums=('4facdd6e152db3c2568a2348a2756441')

package() {
	mkdir -p ${pkgdir}/usr/share/themes/${_themename}/
	cd ${srcdir}/${_themename}-$pkgver
	cp -R openbox-3 ${pkgdir}/usr/share/themes/${_themename}/
	cp -R xfwm4 ${pkgdir}/usr/share/themes/${_themename}/
	cp -R gtk-2.0 ${pkgdir}/usr/share/themes/${_themename}/
	cp -R gtk-3.0 ${pkgdir}/usr/share/themes/${_themename}/
	cp README.md ${pkgdir}/usr/share/themes/${_themename}/README
	cp LICENSE ${pkgdir}/usr/share/themes/${_themename}/
	cp CREDITS ${pkgdir}/usr/share/themes/${_themename}/
}