# Mantainer: harry218

pkgname=numix-square-xfwm4
pkgver=2014.09.19
pkgrel=1
pkgdesc="Square variation of Numix XFWM4 theme."
arch=('any')
url="https://github.com/shimmerproject/Numix"
license=('GPL3')
depends=('xfwm4')
source=(http://sourceforge.net/projects/numix-square-xfwm4/files/numix-square-xfwm4.zip/download)
md5sums=('d900bba0d43b520522ab3fd468ec4c05')

package() {
	mkdir -p ${pkgdir}/usr/share/themes/
	rm ${srcdir}/download
	cp -r ${srcdir}/* ${pkgdir}/usr/share/themes/
}