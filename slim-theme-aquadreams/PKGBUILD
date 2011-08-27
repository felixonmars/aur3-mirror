# Contributor: Jib <jbc dot as AT free dot fr>
# Last update: 02/13/10

pkgname=slim-theme-aquadreams
pkgver=1.1.1
pkgrel=1
pkgdesc="Slim theme for gnome-theme-aquadreams."
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
license=('GPL')
depends=('slim' 'gnome-theme-aquadreams')
source=("green-panel.png" "aquadreams.slim.theme")
install=aquadreams.install
md5sums=('7f1ee459bf8a72e075486fb40d1e26c1' '981b0f028c56c43123c2a977254e385a')

build() {
	install -d ${pkgdir}/usr/share/slim/themes/aquadreams
	cp green-panel.png ${pkgdir}/usr/share/slim/themes/aquadreams/panel.png
	cp aquadreams.slim.theme ${pkgdir}/usr/share/slim/themes/aquadreams/slim.theme
	ln -s /usr/share/pixmaps/backgrounds/gnome/other/AquaDreams.jpg ${pkgdir}/usr/share/slim/themes/aquadreams/background.jpg
}
