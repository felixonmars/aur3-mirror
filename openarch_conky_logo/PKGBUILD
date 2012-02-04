# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_conky_logo
pkgver=0.1
pkgrel=4
logo_name="2_white"
pkgdesc="Conky config for OpenArch"
arch=('any')
url="http://ovsinc.narod.ru"
license=('GPL')
groups=('openarch_gray')
depends=('conky' 'libpng')
source=('openarch_icons.tar.gz')


build() {
	install -m755  -d "${pkgdir}"/usr/share/conky/conky_main/openarch_logo
	install -D -m644 "${srcdir}"/icons/*.png "${pkgdir}"/usr/share/conky/conky_main/openarch_logo/

	cd "${pkgdir}"/usr/share/conky/conky_main/openarch_logo/
	ln -s "openarch_${logo_name}.png" "alogo.png"
}

md5sums=('1e5cfe23564435afe8cf427fc2be1ab7')
