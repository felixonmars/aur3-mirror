# Maintainer: Tetsumaki <http://goo.gl/YMBdA>

pkgname=leed-theme-tornede-git
_gitname=tornede
pkgver=20130406
pkgrel=1
pkgdesc="Tornede is a theme inspired by Google Reader and Feedly for Leed."
arch=('any')
url="https://github.com/Tetsumaki/"
license=('CC by-nc-sa')
depends=('leed-git')
makedepends=('git')
source=('git://github.com/Tetsumaki/tornede.git')
sha1sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
	cd "${_gitname}"
	install -dm755 "${pkgdir}/usr/share/webapps/leed/templates/${_gitname}"
	cp -rf . "${pkgdir}/usr/share/webapps/leed/templates/${_gitname}"
	cd "${pkgdir}/usr/share/webapps/leed/templates/${_gitname}"
	rm -rf {.git,README.md}
	chmod -R 755 "${pkgdir}/usr/share/webapps/leed/templates/${_gitname}"
}