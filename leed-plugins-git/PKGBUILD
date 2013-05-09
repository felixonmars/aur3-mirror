# Maintainer: Tetsumaki <http://goo.gl/YMBdA>

pkgname=leed-plugins-git
_gitname=Leed-market
pkgver=20130504
pkgrel=1
pkgdesc="All plugins from the Leed-Market"
arch=('any')
url="http://projet.idleman.fr/leed/"
license=('CC by-nc-sa')
depends=('leed-git')
makedepends=('git')
source=('git://github.com/ldleman/Leed-market.git')
install=${pkgname}.install
sha1sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
	cd "${_gitname}"
	install -dm755 "${pkgdir}/usr/share/webapps/leed/plugins"
	cp -rf . "${pkgdir}/usr/share/webapps/leed/plugins"
	cd "${pkgdir}/usr/share/webapps/leed/plugins"
	rm -rf {.git,README.md}
	chmod -R 755 "${pkgdir}/usr/share/webapps/leed/plugins"
}
