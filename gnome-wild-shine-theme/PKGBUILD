# Contributor: wido <widomaker2k7@gmail.com>

pkgname=gnome-wild-shine-theme
pkgver=1.2.1
pkgrel=1
pkgdesc="Wild shine theme for Gnome."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk-engine-murrine')
source=("http://ppa.launchpad.net/bisigi/ppa/ubuntu/pool/main/w/wild-shine-theme/wild-shine-theme_${pkgver}.jaunty.ppa1+nmu1.tar.gz")
url="http://francois.vogelweith.com"
md5sums=('bad92548fe054452fe72a6ed53aeda2c')

build() {
	cd ${srcdir}/wild-shine-theme-jaunty
	
	# GDM Theme
	install -d ${pkgdir}/usr/share/gdm/themes/
	
	cd ${srcdir}/wild-shine-theme-jaunty/GDM
	tar -xzvf wild-shine.tar.gz
	mv wild-shine/ ${pkgdir}/usr/share/gdm/themes/
	
	#GTK theme
	install -d ${pkgdir}/usr/share/themes/
	
	cd ${srcdir}/wild-shine-theme-jaunty/Gtk
	tar -xzvf wild-shine.tar.gz
	mv wild-shine/ ${pkgdir}/usr/share/themes/
	sed -i s/"\/usr\/share\/backgrounds"/"\/usr\/share\/pixmaps\/backgrounds\/gnome\/nature"/ ${pkgdir}/usr/share/themes/wild-shine/index.theme
	
	#Icons theme
	install -d ${pkgdir}/usr/share/icons
	
	cd ${srcdir}/wild-shine-theme-jaunty/Icons
	tar -xjvf wild-shine.tar.bz2
	mv wild-shine/ ${pkgdir}/usr/share/icons
	
	#Wallpaper 
	install -d ${pkgdir}/usr/share/pixmaps/backgrounds/gnome/nature/
	
	cd ${srcdir}/wild-shine-theme-jaunty/Wallpaper
	install -D -m644 wild_shine.png  ${pkgdir}/usr/share/pixmaps/backgrounds/gnome/nature/
	
	#Emerald theme
	install -d ${pkgdir}/usr/share/emerald/themes/wild_shine

	cd ${srcdir}/wild-shine-theme-jaunty/Emerald
	tar -xzvf wild_shine.emerald -C ${pkgdir}/usr/share/emerald/themes/wild_shine
	}

