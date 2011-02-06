# Contributor: Jib <jbc.as (AT) free.fr>
# Last update: 11/02/10

pkgname=slim-theme-split
pkgver=1.0
pkgrel=1
pkgdesc="Slim theme for gnome-theme-split."
arch=('any')
url="http://www.archlinux.org"
license=('GPL')
depends=('slim' 'gnome-theme-split')
source=(arch-panel.png
        split.slim.theme)
install=split.install
md5sums=('c320a58797bcf5fcc9328d4824c4f34b' '0052bba4dc0bef530c584471fc81ac9a')

build() {
	install -d ${pkgdir}/usr/share/slim/themes/split
	cp arch-panel.png ${pkgdir}/usr/share/slim/themes/split/panel.png
	cp split.slim.theme ${pkgdir}/usr/share/slim/themes/split/slim.theme
	ln -s /usr/share/pixmaps/backgrounds/gnome/other/split.jpg ${pkgdir}/usr/share/slim/themes/split/background.jpg
}
