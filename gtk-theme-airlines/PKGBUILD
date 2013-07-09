# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Jib <jbc.as (AT) free.fr>
# Last Update: 12/03/10

pkgname=gtk-theme-airlines
_pkgname=airlines-theme
pkgver=1.5.1
pkgrel=2
pkgdesc="Airlines theme for Xfce and Mate."
arch=(any)
depends=('gtk-engine-murrine>=0.98')
optdepends=('slim-theme-airlines: matching theme for slim login manager')
license=('GPL')
source=(https://launchpad.net/~bisigi/+archive/ppa/+files/airlines-theme_1.5.1.maverick.ppa2.tar.gz
        arch-icon-64.svg
        arch-icon-48.svg
        arch-icon-24.svg
        arch-icon-22.svg
        arch-icon-16.svg
        airlines.patch)
url="http://www.bisigi-project.org"
md5sums=('465e43de609135ff1e624dd2d20d4006'
         '7b6cf784aa57bb00627d6c5671370490'
         'd9ca3f533d8f1f4d6a39151287694215'
         '58cf478d63320c2b6dc4671b908cfeb1'
         '8e7fee479f2712662dbc796dd714bef1'
         '18b79fde3758cce58d421ba3c2933e1d'
         '209cbd8b0295dfc34dc5a38663418f09')

package() {
	cd ${srcdir}/${_pkgname}
	# install dirs
	install -d ${pkgdir}/usr/share/{themes,icons,backgrounds,gnome-background-properties,doc/bisigi/airlines}
	
	#GTK theme
	tar -xzf Gtk/airlines.tar.gz -C Gtk/
	#Icons theme
	echo "Unpacking icons..."
	tar -xjf Icons/airlines.tar.bz2 -C Icons/
	local _w=""
	for _w in {16,22,24,48,64} ; do
    	install -D -m644 ${startdir}/arch-icon-$_w.svg Icons/airlines/places/$_w/start-here.svg
 	done
    rm -f Icons/airlines/COPYING
	# install files
	patch -Np0 <${srcdir}/airlines.patch
	cp -R Gtk/airlines/ ${pkgdir}/usr/share/themes/
	cp -R Icons/airlines/ ${pkgdir}/usr/share/icons
	cp -R Wallpaper/airlines ${pkgdir}/usr/share/backgrounds/
	install -D -m644 Wallpaper/airlines/airlines-wallpaper.xml ${pkgdir}/usr/share/gnome-background-properties/
	install -D -m644 credits ${pkgdir}/usr/share/doc/bisigi/airlines/credits.txt
}
