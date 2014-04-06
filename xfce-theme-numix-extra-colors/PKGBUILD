# Mantainer: defendor at riseup dot net

pkgname=xfce-theme-numix-extra-colors
pkgver=2013.09.10
pkgrel=1
pkgdesc="Different color varients of the Numix GTK 2.0 and 3.0 theme for Xfce"
arch=('any')
url="http://www.deviantart.com/#/art/Numix-Extra-Colors-for-XFCE-399448570?hf=1"
license=('GPL3')
depends=('gtk-engine-murrine')
source=(http://fc04.deviantart.net/fs70/f/2013/253/2/7/numix_extra_color_for_xfce_by_ugoyak-d6ltkhm.zip)
md5sums=('47fa1e62bfe84df205f74df9c242cd89')

package() {
	mkdir -p ${pkgdir}/usr/share/themes/
	rm ${srcdir}/README
	cp -r ${srcdir}/* ${pkgdir}/usr/share/themes/
}