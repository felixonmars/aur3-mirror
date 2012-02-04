# Contributor: wido <widomaker2k7@gmail.com>
# Maintainer: Mario Blättermann <mariobl@gnome.org>

pkgname=gnome-exotic-theme
pkgver=1.6.1
pkgrel=1
pkgdesc="Exotic theme for GNOME"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk-engine-murrine')
source=("http://ppa.launchpad.net/bisigi/ppa/ubuntu/pool/main/e/exotic-theme/exotic-theme_$pkgver.maverick.ppa1+nmu1.tar.gz")

url="http://francois.vogelweith.com"
md5sums=('d9e0c29fda1f4e191a1663796446634e')

build() {
	cd ${srcdir}/exotic-theme
	
	#GTK theme
	install -d ${pkgdir}/usr/share/themes/
	
	cd ${srcdir}/exotic-theme/Gtk
	tar -xzvf exotic.tar.gz
	mv exotic/ ${pkgdir}/usr/share/themes/
	sed -i s/"\/usr\/share\/backgrounds"/"\/usr\/share\/pixmaps\/backgrounds\/gnome\/nature"/ ${pkgdir}/usr/share/themes/exotic/index.theme
	
	#Icons theme
	install -d ${pkgdir}/usr/share/icons
	
	cd ${srcdir}/exotic-theme/Icons
	tar -xjvf exotic.tar.bz2
	mv exotic/ ${pkgdir}/usr/share/icons
	
	#Wallpaper 
	install -d ${pkgdir}/usr/share/pixmaps/backgrounds/gnome/nature/
	
	cd ${srcdir}/exotic-theme/Wallpaper
	install -D -m644 exotic.jpg  ${pkgdir}/usr/share/pixmaps/backgrounds/gnome/nature/
	
	#Emerald theme
	install -d ${pkgdir}/usr/share/emerald/themes/exotic

	cd ${srcdir}/exotic-theme/Emerald
	tar -xzvf exotic.emerald -C ${pkgdir}/usr/share/emerald/themes/exotic
	}

