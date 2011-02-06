# Contributor: Jib <jbc dot as AT free dot fr>
# Last update: 09/02/10

pkgname=slim-theme-tropical
pkgver=1.1.1
pkgrel=1
pkgdesc="Slim theme for gnome-theme-tropical."
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
license=('GPL')
depends=('slim' 'gnome-theme-tropical')
source=("green-panel.png" "tropical.slim.theme")
md5sums=('7f1ee459bf8a72e075486fb40d1e26c1' 'd95438bcc19a2fc27139597fad46db5c')
install=tropical.install

build() {
	install -d ${pkgdir}/usr/share/slim/themes/tropical
	cp green-panel.png ${pkgdir}/usr/share/slim/themes/tropical/panel.png
	cp tropical.slim.theme ${pkgdir}/usr/share/slim/themes/tropical/slim.theme
	ln -s /usr/share/pixmaps/backgrounds/gnome/nature/Naturelle-leaf.jpg ${pkgdir}/usr/share/slim/themes/tropical/background.jpg
}
