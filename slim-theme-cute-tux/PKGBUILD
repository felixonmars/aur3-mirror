# Contributor: gg <giorgio@@@gilest.ro>
# Last update: 04/25/10

pkgname=slim-theme-cute-tux
pkgver=1.0
pkgrel=1
pkgdesc="Simple and cute Slim theme"
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
license=('GPL')
depends=('slim')
source=("background.jpg" "panel.png" "cutetux.slim.theme")
install=cutetux.install
md5sums=('29c4ab332474f8a20790886a721c1743'
	 'b3d32035cd0c7a1b74a9a9be0d6c8d86'
	 '4d7105e4548658fdd04c6a1f31e91a1d')

build() {
	install -d ${pkgdir}/usr/share/slim/themes/cute-tux
	cp panel.png ${pkgdir}/usr/share/slim/themes/cute-tux/panel.png
	cp background.jpg ${pkgdir}/usr/share/slim/themes/cute-tux/background.jpg
	cp cutetux.slim.theme ${pkgdir}/usr/share/slim/themes/cute-tux/slim.theme

}
