# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_openbox_scripts
pkgver=0.2.2
pkgrel=1
pkgdesc="Some wrapper scripts for openbox"
arch=('any')
groups=('openarch_scripts')
url="http://ovsinc.narod.ru"
license=('GPL')
depends=('openbox' 'bash' 'perl' 'gnome-menus2')
source=('openbox_scripts.tar.gz')


build() {
	cd "${srcdir}"
	install -d -m755 "${pkgdir}"/usr/bin
	install -m755 "${srcdir}"/scripts/* "${pkgdir}/usr/bin/${i}"
}
md5sums=('98a5d9af1914ca8106b6d83d964cdb08')
