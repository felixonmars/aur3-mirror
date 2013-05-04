# Contributor: Václav Kramář <vaclav.kramar@tiscali.cz>
# Contributor: Eric Herrera <eric.gnome@gmail.com>

pkgname=xfce4-theme-pack-nimbus
pkgver=0.1.7
pkgrel=1
pkgdesc="Nimbus GTK engine and themes and xfwm4 theme"
arch=('i686' 'x86_64')
url="http://www.sun.com/software/javadesktopsystem/"
license=('GPL')
depends=('libx11' 'gtk2' 'intltool' 'icon-naming-utils' 'gnome-common')
makedepends=('autogen')
conflicts=('nimbus')
source=(http://dlc.sun.com/osol/jds/downloads/extras/nimbus/nimbus-0.1.7.tar.bz2
        http://xfce-look.org/CONTENT/content-files/113884-nimbus_plain_graphite-0.1.4-5.tar.gz
        http://xfce-look.org/CONTENT/content-files/77327-Nimbus-Vistalooks-1.10.zip
        http://xfce-look.org/CONTENT/content-files/54830-Nimbus-Glossy-Menus.tar.bz2
        http://xfce-look.org/CONTENT/content-files/101276-XFWM4-Nimbus-0.03.tar.gz)
md5sums=('ecc2d3d05efab3cbe5bad0e9aeec2be8'
         '64cdc7ee46599a261ba26e04a75f018a'
         '24679ad4c5308001ed937713e1d7f5e0'
         '967f18556fda7170ced7313c35af5504'
         '929d67bf157e4c7867608fba4564c423')

prepare() {
    sed -i 's:AM_CONFIG_HEADER:AC_CONFIG_HEADERS:' ${srcdir}/nimbus-0.1.7/configure.in
}

build() {
	# original gtk engine with basic gtk themes and icon theme
	cd ${srcdir}/nimbus-0.1.7

	./autogen.sh --prefix=/usr
	make
}

package(){
	cd ${srcdir}/nimbus-0.1.7
	make prefix=${pkgdir}/usr install
	rm -rf ${pkgdir}/usr/share/themes/dark-nimbus/metacity-1
	rm -rf ${pkgdir}/usr/share/themes/light-nimbus/metacity-1
	rm -rf ${pkgdir}/usr/share/themes/nimbus/metacity-1

	# get back to srcdir
	cd ${srcdir}

	# nimbus-plain gtk themes
	cp -r nimbus_plain_large ${pkgdir}/usr/share/themes
	cp -r nimbus_plain_small ${pkgdir}/usr/share/themes
	cp -r nimbus_plain_graphite_large ${pkgdir}/usr/share/themes
	cp -r nimbus_plain_graphite_small ${pkgdir}/usr/share/themes

	# nimbus-vistalooks gtk theme
	cp -r Nimbus-Vistalooks ${pkgdir}/usr/share/themes

	# nimbus-glossy-menus gtk theme
	cp -r Nimbus-Glossy-Menus ${pkgdir}/usr/share/themes
	cp -r Nimbus-Glossy-Menus-Deep ${pkgdir}/usr/share/themes

	# nimbus+ xfwm4 theme
	mv Nimbus Nimbus-plus
	cp -r Nimbus-plus  ${pkgdir}/usr/share/themes
}
