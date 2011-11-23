# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_wbar_theme
pkgver=0.2
pkgrel=2
pkgdesc="Wbar theme and icons for openarch"
arch=('any')
groups=('openarch_gray')
url="http://alecive.deviantart.com/"
license=('GPL')
depends=('wbar')
optdepends=('wbarconf: Configuration GUI for wbar written in Python and GTK')
source=("http://dl.dropbox.com/u/19256622/src/$pkgname/wbar_icons_openarch-${pkgver}.tar.gz")


build() {
	cd "${srcdir}"
	install -d -m755 "${pkgdir}"/usr/share/wbar/iconpack/openarch
	cd "${srcdir}/openarch"
	for i in *.png; do 
	    install  -D -m644 "${i}" "${pkgdir}/usr/share/wbar/iconpack/openarch/${i}"
	done
}



md5sums=('b465523541eb512be868d901eb95a2ab')
