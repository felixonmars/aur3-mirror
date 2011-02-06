# Contributor: Jib <jbc dot as AT free dot fr>
# Last update: 07/02/10

pkgname=slim-theme-ubuntu-sunrise
pkgver=1.1.1
pkgrel=2
pkgdesc="Slim theme for gnome-theme-ubuntu-sunrise."
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
license=('GPL')
depends=('slim' 'gnome-theme-ubuntu-sunrise')
source=("gold-panel.png" "ubuntu-sunrise.slim.theme")
md5sums=('f8b01680333493f7680971c2d5805f31' '9174b59b6ddf9943cee2bb929d85c8ba')
install=ubuntu-sunrise.install

build() {
	install -d ${pkgdir}/usr/share/slim/themes/ubuntu-sunrise
	cp gold-panel.png ${pkgdir}/usr/share/slim/themes/ubuntu-sunrise/panel.png
	cp ubuntu-sunrise.slim.theme ${pkgdir}/usr/share/slim/themes/ubuntu-sunrise/slim.theme
	ln -s /usr/share/pixmaps/backgrounds/gnome/nature/A_day_at_the_savannah.jpg \
		${pkgdir}/usr/share/slim/themes/ubuntu-sunrise/background.jpg
}
