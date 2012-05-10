# Maintainer: Lars Jacob <lars at jaclar dot net>
# Contributor:: Markus Unterwaditzer <markus at unterwaditzer dot net>
# Contributor: Jussi Timperi <jussi.timperi at gmail dot com>

pkgname=gnome-shell-extension-shellshape-git
pkgver=20120510
pkgrel=1
pkgdesc="A tiling window manager extension for gnome-shell"
arch=(any)
url="http://gfxmonk.net/shellshape/"
license=('GPL3')
depends=('gnome-shell>=3.4.0')
makedepends=('git')
provides=('gnome-shell-extension-shellshape')
conflicts=('gnome-shell-extension-shellshape')
md5sums=('c7d15dd90900d8b847baf088d1c8f340')

_gitroot="git://github.com/gfxmonk/shellshape.git"
_gitname="shellshape"
_gitbranch="master"

build() {
		cd "$srcdir"
		msg "Connecting to GIT server...."

		if [ -d $_gitname ] ; then
				cd $_gitname && git pull origin
				git checkout $_gitbranch # just to be sure
				msg "The local files are updated."
		else
				git clone $_gitroot $_gitname
				cd $_gitname && git checkout $_gitbranch
		fi

		msg "GIT checkout done or server timeout"
		msg "Starting make..."

		rm -rf "$srcdir/$_gitname-build"
		git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
		cd "$srcdir/$_gitname-build"

}

package() {
		mkdir -p "$pkgdir/usr/share/gnome-shell/extensions"
		mkdir -p "$pkgdir/usr/share/gnome-shell/js"
		mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/status"
#		mkdir -p "$pkgdir/usr/share/glib-2.0/schemas"
		cp -p $srcdir/$_gitname-build/lib/* "$pkgdir/usr/share/gnome-shell/js/"
		cp -pr "$srcdir/$_gitname-build/shellshape" \
			"$pkgdir/usr/share/gnome-shell/extensions/shellshape@gfxmonk.net"
		cp -p $srcdir/$_gitname-build/icons/status/*.svg \
			"$pkgdir/usr/share/icons/hicolor/scalable/status"
		cp -pr $srcdir/$_gitname-build/schemas \
			"$pkgdir/usr/share/gnome-shell/extensions/shellshape@gfxmonk.net/schemas"
}
