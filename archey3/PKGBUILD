# Maintainer: Laurie Clark-Michalek <bluepeppers@archlinux.us>
# Contributer: graysky <graysky AT archlinux DOR us>

pkgname=archey3
pkgver=0.4.29.gb4cc4bb
pkgrel=1
pkgdesc="Python script to display system infomation alongside the Arch Linux logo."
arch=('any')
url="http://bluepeppers.github.com/archey3"
license=('GPL')
depends=('python')
makedepends=('git' 'python-distribute')
optdepends=(
'python3-mpd-git: python mpd libary for mpd protocol (optional, mpc can be used instead)'
'python-logbook-git: for logging'
'imagemagick: for default screenshot command'
)
conflicts=('archey')
provides=('archey')
source="git://github.com/bluepeppers/archey3.git"
md5sums=('SKIP')

pkgver() {
	cd ${pkgname}
	git describe --always | sed 's|-|.|g'
}

package() {
	cd ${pkgname}
	python setup.py install --root=${pkgdir}
	ln -s /usr/bin/archey3 ${pkgdir}/usr/bin/archey
	install -D -m644 COPYING ${pkgdir}/usr/share/licenses/archey/COPYING
} 
