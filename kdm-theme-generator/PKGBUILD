# Maintainer: ifaigios <ifaigios_at_gmail_dot_com>
# Contributor: Dylon Edwards <deltaecho@archlinux.us>

pkgname=kdm-theme-generator
pkgver=0.8
pkgrel=2
pkgdesc="Generates a KDM theme from your current Plasma theme and wallpaper"
url="http://kde-look.org/content/show.php/Kdm+theme+generator?content=102760"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdebase-workspace')
makedepends=('automoc4' 'cmake')
install="${pkgname}.install"
source=("http://kde-look.org/CONTENT/content-files/102760-KdmThemeGenerator.tar.gz")
md5sums=('44861233ffb71b6f78aa67387d331518')

build() {
	cd ${srcdir}/KdmThemeGenerator
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
        cd ${srcdir}/KdmThemeGenerator
	make DESTDIR="${pkgdir}" install
	mv "${pkgdir}/usr/bin/KdmThemeGenerator" "${pkgdir}/usr/bin/kdm-theme-generator"
	install -Dm755 copyFromUserToSystem.sh "${pkgdir}/usr/bin/install-kdm-theme"
}
