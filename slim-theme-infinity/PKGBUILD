# Contributor: Jib <jbc.as _AT_ free _DOT_ fr>
# Last update: 11/02/10

pkgname=slim-theme-infinity
pkgver=1.1.1
pkgrel=2
pkgdesc="Slim theme for gnome-theme-infinity."
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
license=('GPL')
depends=('slim' 'gnome-theme-infinity')
install=infinity.install
source=("blue-panel.png" "infinity.slim.theme")
md5sums=('784169907cc98ee0d2608f251d468274' 'f4041fa2178d204e2afe61f8c6c56fea')

build() {
	install -d ${pkgdir}/usr/share/slim/themes/infinity
	cp blue-panel.png ${pkgdir}/usr/share/slim/themes/infinity/panel.png
	cp infinity.slim.theme ${pkgdir}/usr/share/slim/themes/infinity/slim.theme
	ln -s /usr/share/pixmaps/backgrounds/gnome/other/infinity.jpg ${pkgdir}/usr/share/slim/themes/infinity/background.jpg
}
