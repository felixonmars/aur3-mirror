# Contributor: wido <widowild [at] myopera [dot] com>
# Maintainer: SanskritFritz (gmail)

pkgname=logkeys-keymap-svn
pkgver=90
pkgrel=2
pkgdesc="Keymaps packs for logkeys"
arch=('any')
license=('GPL3')
url="http://code.google.com/p/logkeys/"
conflicts=('logkeys-keymap')
provides=('logkeys-keymap')
source=()
md5sums=()

_svnmod="keymaps"
_svntrunk="http://logkeys.googlecode.com/svn/wiki/keymaps/"

build() {
	cd "$srcdir"
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up)
	else
		svn co $_svntrunk $_svnmod
	fi

}

package() {
	cd "${srcdir}/$_svnmod"
	for filename in $(ls *.map); do
		install -D -m 644 ${filename} ${pkgdir}/usr/share/lkmaps/${filename} || return 1
	done
}
