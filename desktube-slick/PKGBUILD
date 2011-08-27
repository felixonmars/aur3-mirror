# Contributor: Prurigro
# Maintainer: Prurigro

pkgname=desktube-slick
pkgver=72.0.9
pkgrel=1
pkgdesc="Adobe Air Application for Youtube using a Custom SVG Iconset"
arch=('i686' 'x86_64')
url="http://thedesktube.com/"
license=('custom')
source=(http://thedesktube.com/DeskTube.air
	desktube.desktop
	desktube.svg
	desktube)
md5sums=('a97196acd6c9621dac0303c4acb5881a'
         '1866411ee1e40f46ba94578f3936a5dc'
         'b9f513990f62011a18ebb1c3e0dc6eb8'
         'b76586826476187e7e0ab008ca240e67')
depends=('adobe-air')
makedepends=('unzip' 'imagemagick')

build() {
	if [ -d ${startdir}/src/DeskTube ]; then
		echo "==> Remove build directory and try again"
		return 1
	fi
	install -d ${startdir}/src/DeskTube || return 1
	pushd ${startdir}/src/DeskTube || return 1
		
		unzip ../DeskTube.air || return 1
		convert -background transparent -scale 32x32 ../desktube.svg png:icons/icon_016.png || return 1
		convert -background transparent -scale 32x32 ../desktube.svg png:icons/icon_032.png || return 1
		convert -background transparent -scale 48x48 ../desktube.svg png:icons/icon_048.png || return 1
		convert -background transparent ../desktube.svg png:icons/icon_128.png || return 1
		zip -r DeskTube.air * || return 1
		install -d ${pkgdir}/usr/share/desktube || return 1
		install -D -m644 DeskTube.air ${pkgdir}/usr/share/desktube/ || return 1
	popd || return 1
	pushd ${startdir}/src || return 1
		install -d ${pkgdir}/usr/share/applications || return 1
		install -m644 -D desktube.desktop ${pkgdir}/usr/share/applications/ || return 1
		install -d ${pkgdir}/usr/share/pixmaps || return 1
		install -m644 -D desktube.svg ${pkgdir}/usr/share/pixmaps/ || return 1
		install -d ${pkgdir}/usr/bin || return 1
		install -m755 -D desktube ${pkgdir}/usr/bin/ || return 1
	popd || return 1
}

