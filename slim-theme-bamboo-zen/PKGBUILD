# Contributor: Jib <jbc dot as AT free dot fr>
# Last update: 02/13/10

pkgname=slim-theme-bamboo-zen
pkgver=1.1.1
pkgrel=1
pkgdesc="Slim theme for gnome-theme-bamboo-zen."
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
license=('GPL')
depends=('slim' 'gnome-theme-bamboo-zen')
source=("greenish-panel.png" "bamboo-zen.slim.theme")
install=bamboo-zen.install
md5sums=('e4df8f001b1133daecbe62317ed711a8' 'bb9999188df7b2bcd5207936054b5ad9')

build() {
	install -d ${pkgdir}/usr/share/slim/themes/bamboo-zen
	cp greenish-panel.png ${pkgdir}/usr/share/slim/themes/bamboo-zen/panel.png
	cp bamboo-zen.slim.theme ${pkgdir}/usr/share/slim/themes/bamboo-zen/slim.theme
	ln -s /usr/share/pixmaps/backgrounds/gnome/nature/Bamboo-Zen.jpg ${pkgdir}/usr/share/slim/themes/bamboo-zen/background.jpg
}
