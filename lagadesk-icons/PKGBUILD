# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=lagadesk-icons
pkgver=0.1
pkgrel=1
pkgdesc="Icon themes by LaGaDesk"
arch=('any')
url="http://lagadesk.deviantart.com"
license=('GPL')
depends=('gtk2')
source=('http://www.deviantart.com/download/144847996/LaGaDesk_BlackWhite_III_1_5_0_by_LaGaDesk.zip')

md5sums=('4aa8d72364b99bd8b5b3ff24248d7779')

build() {
	cd "${srsdir}"
	install -d -m755 "${pkgdir}"/usr/share/icons
	tar xf "${srcdir}"/LaGaDesk-BW-III/LaGaDesk-BlackWhite-III.tar.bz2 -C "${pkgdir}"/usr/share/icons/
}
