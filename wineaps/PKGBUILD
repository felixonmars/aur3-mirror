pkgname=wineaps
pkgver=1.00
pkgrel=3
pkgdesc="Wine automatic prefix selector and menu item generator."
arch=('i686' 'x86_64')
url="http://xnode.org/wineaps"
license=('custom')
depends=('optipng' 'wget' 'zenity')
source=('https://xnode.org/wineaps/wineaps-1.00.tar.xz')
md5sums=('4ec1cfa8d3fa72cb9c3358bb6a0898e6')

package() {
	install -Dm755 ${srcdir}/wineaps ${pkgdir}/usr/bin/wineaps
	install -Dm755 ${srcdir}/wineapsmg ${pkgdir}/usr/bin/wineapsmg
	install -Dm755 ${srcdir}/wineapsmg.desktop ${pkgdir}/usr/share/applications/wineapsmg.desktop
	install -Dm755 ${srcdir}/wineapsmg.png ${pkgdir}/usr/share/pixmaps/wineapsmg.png
}
