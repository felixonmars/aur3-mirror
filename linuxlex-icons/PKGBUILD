# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=linuxlex-icons
pkgver=0.1
pkgrel=1
pkgdesc="Icon theme LinuxLex-BlackWhite"
arch=('any')
url="http://linuxlex.cz/index.php/en/theme-metacity/viewcategory/4.html"
license=('GPL')
depends=('gtk2')
source=('http://linuxlex.tym.cz/icon/LinuxLex-BlackWhite.tar.gz')

md5sums=('cac05990c50fe1e9dcd24beba0e8d25f')

build() {
	cd "${srsdir}"
	install -d -m755 "${pkgdir}"/usr/share/icons
	mv LinuxLex-BlackWhite "${pkgdir}"/usr/share/icons/
}
