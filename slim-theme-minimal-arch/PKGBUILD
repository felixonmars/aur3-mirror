# Maintainer DaLinuxCookie <cookie@openmailbox.org>

_themename=minimal-arch
pkgname=slim-theme-minimal-arch
pkgver=1.4
pkgrel=1
pkgdesc='Minimalist Arch Linux theme for SLiM'
arch=('any')
license=('GPL3')
depends=('slim')
optdepends=(
'ttf-ubuntu-font-family: for better looking font'
)
url="https://github.com/DaLinuxCookie/minimal-arch"
source=(https://github.com/DaLinuxCookie/${_themename}/archive/$pkgver.zip)
md5sums=('a264c2f83fe6fe57861b7fbd73ada35e')

package() {
	mkdir -p ${pkgdir}/usr/share/slim/themes/${_themename}/
	cd ${srcdir}/${_themename}-$pkgver
	cp background.jpg ${pkgdir}/usr/share/slim/themes/${_themename}/
	cp panel.png ${pkgdir}/usr/share/slim/themes/${_themename}/
	cp slim.theme ${pkgdir}/usr/share/slim/themes/${_themename}/
	cp README ${pkgdir}/usr/share/slim/themes/${_themename}/
}