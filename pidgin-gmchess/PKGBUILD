# Contributor: lerosua <lerosua@gmail.com>
pkgname=pidgin-gmchess
pkgver=0.02
pkgrel=1
pkgdesc="gmchess play network with pidgin"
arch=(x86_64 i686)
url="http://www.lerosua.org"
depends=("pidgin>=2.6 gmchess>0.29.1")
license=('GPL')
source=(http://gmchess.googlecode.com/files/pidgin-gmchess-${pkgver}.tar.gz)
md5sums=('94688cc6970e0fe588479851ca86ca14')
build() {
	cd ${srcdir}/pidgin-gmchess-${pkgver}/
	make || return 1
  install -d ${pkgdir}/usr/lib/pidgin/
	install -D -m 644 gmchess-network.so  ${pkgdir}/usr/lib/pidgin/ 
  install -d ${pkgdir}/usr/share/icons/hicolor/22x22/apps/
	install -D -m 644 gmchess.png  ${pkgdir}/usr/share/icons/hicolor/22x22/apps/ 
}
# vim:set ts=2 sw=2 et:
