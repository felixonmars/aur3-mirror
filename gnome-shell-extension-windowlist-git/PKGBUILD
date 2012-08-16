# Maintainer: Raphael Nestler <rnestler at hsr.ch>

pkgname=gnome-shell-extension-windowlist-git
pkgver=20120809
pkgrel=1
pkgdesc="gnome-shell-windowlist adds a window switcher to the top bar of gnome-shell"
arch=('i686' 'x86_64')
url="https://github.com/siefkenj/gnome-shell-windowlist"
license=('GPL2')
depends=('gnome-shell>=3.2.1')
makedepends=('git')
conflicts=('gnome-shell-extension-windowlist')
provides=('gnome-shell-extension-windowlist')

_gitroot="https://github.com/siefkenj/gnome-shell-windowlist.git"
_gitname="gnome-shell-windowlist"
_gitbranch="master"
_EXT_NAME='windowlist@o2net.cl'

build() {
	cd "${srcdir}"
	msg "Connecting to GIT server..."
	if [ -d ${_gitname} ]; then
		cd ${_gitname} && git pull origin ${_gitbranch}
		cd ..
		msg "The local files are updated."
	else
		git clone -b ${_gitbranch} ${_gitroot}
	fi
	msg "GIT checkout done or server timeout"
}

package() {
	mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions"
	cp -a "${srcdir}/${_gitname}/${_EXT_NAME}" "${pkgdir}/usr/share/gnome-shell/extensions"
}
