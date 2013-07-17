# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Jib <jbc.as _AT_ free _DOT_ fr>
# Last update: 11/02/10

pkgname=slim-theme-airlines
pkgver=1.1.1
pkgrel=2
pkgdesc="Slim theme for gnome-theme-airlines."
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
license=('GPL')
depends=('slim' 'gnome-theme-airlines')
install=airlines.install
source=("lightblue-panel.png" "airlines.slim.theme")
md5sums=('baf24816e0288959a357b1b7b61bc2df' '855caeea3d1d1f23c1dbc7d647b03866')

package() {
	install -d ${pkgdir}/usr/share/slim/themes/airlines
	cp lightblue-panel.png ${pkgdir}/usr/share/slim/themes/airlines/panel.png
	cp airlines.slim.theme ${pkgdir}/usr/share/slim/themes/airlines/slim.theme
	ln -s /usr/share/backgrounds/airlines/airlines.jpg ${pkgdir}/usr/share/slim/themes/airlines/background.jpg
}
