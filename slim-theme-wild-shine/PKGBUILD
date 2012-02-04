# Contributor: Jib <jbc.as _AT_ free _DOT_ fr>
# Last update: 05/02/10

pkgname=slim-theme-wild-shine
pkgver=1.1.1
pkgrel=1
pkgdesc="Slim theme for gnome-theme-wild-shine."
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
license=('GPL')
depends=('slim' 'gnome-theme-wild-shine')
source=("green-panel.png" "wild-shine.slim.theme")
install=wild-shine.install
md5sums=('7f1ee459bf8a72e075486fb40d1e26c1' 'dfeed3b16728da657ec6768cece5da84')

build() {
	install -d ${pkgdir}/usr/share/slim/themes/wild-shine
	cp green-panel.png ${pkgdir}/usr/share/slim/themes/wild-shine/panel.png
	cp wild-shine.slim.theme ${pkgdir}/usr/share/slim/themes/wild-shine/slim.theme
	ln -s /usr/share/pixmaps/backgrounds/gnome/nature/wild_shine.jpg ${pkgdir}/usr/share/slim/themes/wild-shine/background.jpg
}
