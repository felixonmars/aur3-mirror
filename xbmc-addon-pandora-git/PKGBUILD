# Maintainer: Aaron Ali <t0nedef@causal.ca>
pkgname=xbmc-addon-pandora-git
pkgver=20130313
pkgrel=1
pkgdesc="XBMC music plugin for Pandora Radio"
arch=('any')
url="https://github.com/k3oni/script.xbmc.pandora"
license=('GPL')
depends=('xbmc')
install=install
makedepends=('git')
provides=(xbmc-addon-pandora)
conflicts=(xbmc-addon-pandora)

_gitroot="git://github.com/k3oni/script.xbmc.pandora.git"
_gitname="script.xbmc.pandora"

build() {
	cd ${srcdir}/
	msg "Connecting to the GIT server...."
	if [[ -d ${srcdir}/${_gitname} ]] ; then
		cd ${_gitname}
		git pull origin
		msg "The local files are updated..."
	else
		git clone ${_gitroot}
	fi
	msg "GIT checkout done. Building."
}

package() {
	mkdir -p ${pkgdir}/usr/share/xbmc/addons/${_gitname}
	for target in `ls ${srcdir}/$_gitname`; do
		cp -r ${srcdir}/${_gitname}/$target ${pkgdir}/usr/share/xbmc/addons/${_gitname}/.
	done
}
