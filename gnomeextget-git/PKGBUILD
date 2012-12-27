# Maintainer: Daniel Sandman <revoltism@gmail.com> 

pkgname=gnomeextget-git
pkgver=20121227
pkgrel=2
pkgdesc="Makes a list of your Gnome extensions for easy sharing."
arch=('any')
url="https://github.com/Almehdi/gnomeExtGet"
license=('GPL')
categories=('utility')
depends=('bash' 'zenity' 'curl')
makedepends=('git')
provides=('gnomeextget')
md5sums=()

_gitroot="git://github.com/Almehdi/gnomeExtGet.git"
_gitname="gnomeExtGet"

build() {
	cd ${srcdir}
	rm -rf gnomeExtGet	
	msg "Connecting to GIT server...."

	if [ -d gnomeExtGet ] ; then
		cd gnomeExtGet && git pull master
		msg "The local files are updated."
	else
		git clone ${_gitroot}
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	cd ${srcdir}/gnomeExtGet

	install -D -m755 gnomeExtGet.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/gnomeExtGet.png
	install -D -m755 gnomeExtGet.desktop ${pkgdir}/usr/share/applications/gnomeExtGet.desktop
	install -D -m755 gnomeExtGet ${pkgdir}/usr/bin/gnomeExtGet
}


