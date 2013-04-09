# Contributor: wido <widowild [at] myopera [dot] com>
# Maintainer: SanskritFritz (gmail)

pkgname=logkeys-keymaps-svn
_svn_name="logkeys-keymaps"
pkgver=105
pkgrel=1
pkgdesc="Keymaps pack for logkeys."
arch=('any')
license=('GPL3')
url="http://code.google.com/p/logkeys/"
conflicts=('logkeys-keymap' 'logkeys-keymaps')
provides=('logkeys-keymaps')
source=("$_svn_name::svn+http://logkeys.googlecode.com/svn/wiki/keymaps/")
md5sums=("SKIP")

pkgver() {
	cd "$SRCDEST/$_svn_name"
	svnversion | tr -d [A-z]
}

package() {
	cd "${srcdir}/$_svn_name"
	for filename in $(ls *.map); do
		install -D -m 644 "${filename}" "${pkgdir}/usr/share/lkmaps/${filename}"
	done
}
