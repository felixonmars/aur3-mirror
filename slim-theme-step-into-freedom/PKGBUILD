# Contributor: Jib <jbc.as (AT) free.fr>
# Last update: 02/13/10

pkgname=slim-theme-step-into-freedom
pkgver=1.1.1
pkgrel=1
pkgdesc="Slim theme for gnome-theme-step-into-freedom."
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
license=('GPL')
depends=('slim' 'gnome-theme-step-into-freedom')
source=("lightblue-panel.png" "step-into-freedom.slim.theme")
md5sums=('baf24816e0288959a357b1b7b61bc2df' 'f2c1edc3e96fb51aad4a3f96fe059167')
install=step-into-freedom.install

build() {
	install -d ${pkgdir}/usr/share/slim/themes/step-into-freedom
	cp lightblue-panel.png ${pkgdir}/usr/share/slim/themes/step-into-freedom/panel.png
	cp step-into-freedom.slim.theme ${pkgdir}/usr/share/slim/themes/step-into-freedom/slim.theme
	ln -s /usr/share/pixmaps/backgrounds/gnome/other/gnome-step-into-freedom1.jpg \
		${pkgdir}/usr/share/slim/themes/step-into-freedom/background.jpg
}
