# Old maintainer: Sebastian Lenz <sebastian@archusers.de>
# Maintainer: Tim Marinin <velkhar@gmail.com>
pkgname=gnome-shell-extension-auto-move-windows-git
pkgver=20130214
pkgrel=1
pkgdesc="Lets you manage your workspaces more easily, assigning a specific workspace to each application as soon as it creates a window, in a manner configurable with a GSettings key. "
arch=('i686' 'x86_64')
url="http://live.gnome.org/GnomeShell/Extensions"
license=('GPL' 'LGPL')
depends=('gnome-shell-extension-common-git')
makedepends=('git' 'gnome-common' 'intltool')
conflicts=('gnome-shell-extensions-git')
_gitroot="git://git.gnome.org/gnome-shell-extensions"
_gitname="gnome-shell-extensions"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot --depth=1
    
		cd $_gitname
		git branch -f gnome-3-6 origin/gnome-3-6
		git checkout gnome-3-6
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	cd ${srcdir}/${_gitname}
	./autogen.sh --prefix=/usr --enable-extensions="auto-move-windows"
}
package() {
	cd ${srcdir}/${_gitname}
	make DESTDIR=${pkgdir} install
	rm -r ${pkgdir}/usr/share/locale
}

