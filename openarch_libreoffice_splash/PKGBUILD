# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_libreoffice_splash
pkgver=1.0
pkgrel=2
pkgdesc="LibreOffice splash for openarch"
arch=('any')
url="http://gnome-look.org/content/show.php/Libre+Office+Splash?content=143150"
license=('GPL')
groups=('openarch_gray')
depends=('libreoffice-common')
install=libreoffice_splash.install
source=('http://gnome-look.org/CONTENT/content-files/143150-spllibreoffice_by_mdh3ll.tar' 'sofficerc')


build() {

	cd "${srcdir}"

	install -d -m755 "${pkgdir}"/usr/share/doc/openarch_libreoffice_splash/
	install -d -m755 "${pkgdir}/usr/lib/libreoffice/program/"
	install -D -m644 "${srcdir}/AUTHORS" "${pkgdir}"/usr/share/doc/openarch_libreoffice_splash/AUTHORS
	install -D -m644 "${srcdir}/COPYING" "${pkgdir}"/usr/share/doc/openarch_libreoffice_splash/COPYING
	install -D -m644 "${srcdir}/png and bmp/libreofficebr.png" "${pkgdir}/usr/lib/libreoffice/program/intro.png_new"
	install -Dm644 "${srcdir}"/sofficerc "${pkgdir}"/etc/libreoffice/sofficerc_new
}


md5sums=('866b9ac2cf53fa29310cbfc2c7e74d02'
         '36bfa7ebc9d06d94864ca7b4266be6d2')
