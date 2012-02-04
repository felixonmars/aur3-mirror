pkgname=slim-theme-hud
pkgver=1.0
pkgrel=1
pkgdesc="Slim-Hud Theme"
install=slim-hud.install
license=('GPL')
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
depends=('slim')
source=(http://fc05.deviantart.net/fs70/f/2011/299/1/4/slim_hud_theme_by_bigrza-d4dzvk2.zip)
md5sums=('ce715c121f2e1cfcf1014bec835ff0b5')

build() {
	cd ${srcdir}/slim-hud
	
	install -m 644 -D background.jpg ${pkgdir}/usr/share/slim/themes/slim-hud/background.jpg
	install -m 644 -D panel.png ${pkgdir}/usr/share/slim/themes/slim-hud/panel.png
	install -m 644 -D slim.theme ${pkgdir}/usr/share/slim/themes/slim-hud/slim.theme
}
