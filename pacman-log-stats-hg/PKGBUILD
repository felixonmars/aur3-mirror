# Maintainer : sebikul <sebikul@gmail.com>

pkgname=pacman-log-stats-hg
pkgver=4
pkgrel=1
pkgdesc="An app to analyze pacman logs and show historical information about the system"
arch=('any')
url="http://code.google.com/p/pacman-log-stats/"
license=('GPL3')
depends=('gambas3-gb-image' 'gambas3-gb-form' 'gambas3-gb-gui' 'gambas3-gb-settings' 'gambas3-gb-form-stock')
	 
makedepends=('gambas3-devel')
provides=('pacman-log-stats')

conflicts=('pacman-log-stats')


_hgroot="http://pacman-log-stats.googlecode.com/hg"
_hgrepo="pacman-log-stats-hg"

build() {
	cd ${srcdir}/${_hgrepo}
	hg update -C || return 1
	
	make
}

package() {
	cd ${srcdir}/${_hgrepo}

	make DESTDIR=$pkgdir install

}