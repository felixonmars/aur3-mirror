# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=moonphase-applet
pkgver=0.1
pkgrel=1
pkgdesc="Applet showing current moon phase. Using GTK+ and Astro::MoonPhase. Alternative to gLunarClock and wmMoonClock."
arch=('any')
license=('GPL')
url="http://aur.archlinux.org/packages.php?ID=31877"
depends=('gtk2-perl' 'perl-astro-moonphase')
provides=('glunarclock' 'wmmoonclock' 'gnome-panel-liblunar')
source=('moonphase-applet.pl' 'moonphase-applet.desktop' 'moonphase-icons.tar.gz')
md5sums=('220e1b7283cefc5a2d5af3fc85f5772f'
         'ff7dc4ef72fa200a94116cd423346145'
         '7f6eb282027f748849519d558da0b749')
build() {
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/applications/
	mkdir -p ${pkgdir}/etc/xdg/autostart
	mkdir -p ${pkgdir}/usr/share/icons/

	cp -f ${srcdir}/moonphase-applet.pl ${pkgdir}/usr/bin/
	cp -f ${srcdir}/moonphase-applet.desktop ${pkgdir}/usr/share/applications/
	cp -f ${srcdir}/moonphase-applet.desktop ${pkgdir}/etc/xdg/autostart/
	cp -rf ${srcdir}/moonphase-icons ${pkgdir}/usr/share/icons/

	chmod -R 755 ${pkgdir}/
}
