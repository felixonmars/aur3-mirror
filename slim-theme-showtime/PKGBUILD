# Contributor: Jib <jbc.as (AT) free.fr>
# Last update: 02/13/10

pkgname=slim-theme-showtime
pkgver=1.1.1
pkgrel=1
pkgdesc="Slim theme for gnome-theme-showtime."
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
license=('GPL')
depends=('slim' 'gnome-theme-showtime')
source=("lightblue-panel.png" "showtime.slim.theme")
install=showtime.install
md5sums=('baf24816e0288959a357b1b7b61bc2df' '2b1be78f0ca9885b87912da7a320ad00')

build() {
	install -d ${pkgdir}/usr/share/slim/themes/showtime
	cp lightblue-panel.png ${pkgdir}/usr/share/slim/themes/showtime/panel.png
	cp showtime.slim.theme ${pkgdir}/usr/share/slim/themes/showtime/slim.theme
	ln -s /usr/share/pixmaps/backgrounds/gnome/other/showtime.jpg ${pkgdir}/usr/share/slim/themes/showtime/background.jpg
}
