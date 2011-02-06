
# Contributor: Trapassati <andrew.ajs@infinito.it>

pkgname=pidgin-monochrome-tray-icons
pkgver=1
pkgrel=2
pkgdesc="Pidgin monochrome Ubuntu 10.04 icon theme for system tray"
arch=('any')
url="http://gnome-look.org/content/show.php/Pidgin+Ubuntu+10.04+Tray+Icons+Set?content=125352"
license=('GPL')
source=('http://dl.dropbox.com/u/205386/pidgin-lynx-icons.tar.gz')
md5sums=('600fbe0293e4a0cbae36ce2d30cf8630')
depends=('pidgin')
makedepends=()

build() {
	mkdir -p "$pkgdir/usr/share/pixmaps/pidgin/tray"
	cp -Rf $srcdir/* "$pkgdir/usr/share/pixmaps/pidgin/tray"
}
