# Maintainer: Tetsumaki <http://goo.gl/YMBdA>

pkgname=leed-theme-greeder-git
_gitname=greeder
pkgver=20130329
pkgrel=1
pkgdesc="Greeder is a theme inspired by Google Reader for Leed."
arch=('any')
url="http://tomcanac.com/greeder/"
license=('CC by-nc-sa')
depends=('leed-git')
makedepends=('git')
source=('git://github.com/tmos/greeder.git')
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
	rm -rf {.git,.gitattributes,.gitignore,LICENCE,README}
	chmod -R 755 "${pkgdir}/usr/share/webapps/leed/templates/${_gitname}"
}