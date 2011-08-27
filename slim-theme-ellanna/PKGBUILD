# Contributor: Jib <jbc.as (AT) free.fr>
# Last update: 02/13/10

pkgname=slim-theme-ellanna
pkgver=1.1.1
pkgrel=1
pkgdesc="Slim theme for gnome-theme-ellanna."
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
license=('GPL')
depends=('slim' 'gnome-theme-ellanna')
source=("pink-panel.png" "ellanna.slim.theme")
md5sums=('0fbcaa3dac50be2823aeacdb128f2ec4' '7c9fd18a8732afc943046f20eccc6c61')
install=ellanna.install

build() {
	install -d ${pkgdir}/usr/share/slim/themes/ellanna
	cp pink-panel.png ${pkgdir}/usr/share/slim/themes/ellanna/panel.png
	cp ellanna.slim.theme ${pkgdir}/usr/share/slim/themes/ellanna/slim.theme
	ln -s /usr/share/pixmaps/backgrounds/gnome/nature/ellanna.jpg ${pkgdir}/usr/share/slim/themes/ellanna/background.jpg
}
