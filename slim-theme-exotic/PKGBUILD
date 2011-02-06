# Contributor: Jib <jbc.as (AT) free.fr>
# Last update: 02/13/10

pkgname=slim-theme-exotic
pkgver=1.1.1
pkgrel=1
pkgdesc="Slim theme for gnome-theme-exotic."
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
license=('GPL')
depends=('slim' 'gnome-theme-exotic')
source=("orange-panel.png" "exotic.slim.theme")
install=exotic.install
md5sums=('442dc4ff7c1d9320f4d4d550c7e762d2' 'c7e6bb08af58def5d497d7ecc9b86777')

build() {
	install -d ${pkgdir}/usr/share/slim/themes/exotic
	cp orange-panel.png ${pkgdir}/usr/share/slim/themes/exotic/panel.png
	cp exotic.slim.theme ${pkgdir}/usr/share/slim/themes/exotic/slim.theme
	ln -s /usr/share/pixmaps/backgrounds/gnome/nature/exotic.jpg ${pkgdir}/usr/share/slim/themes/exotic/background.jpg
}
