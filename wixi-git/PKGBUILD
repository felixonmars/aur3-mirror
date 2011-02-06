#Maintainer: Crazycheese <lct@pisem.net>
#Development version of wixi. Use only if you wish to hack the code.

pkgname=wixi-git
pkgver=20090927
pkgrel=1
pkgdesc="A multi-platform wiki application for the desktop, written in wxpython. Git version."
url="http://wixi.sourceforge.net/"
license="GPL"

arch=('i686' 'x86_64')
provides=('wixi' 'wixi-git')
conflicts=('wixi')
depends=('wxpython')
makedepends=('git')

source=()
md5sums=()

install=${pkgname}.install

_gitroot="git://wixi.git.sourceforge.net/gitroot/wixi/wixi"
_gitname="wixi"

build() {
#retrieving data from git.

	cd $startdir/src
	msg "Connecting to server..."

	if [ -d $startdir/src/$_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi


        msg "GIT checkout done or server timeout"
        msg "Starting build..."

	cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
	cd $startdir/src/$_gitname-build
	
	python setup.py install --root=${pkgdir}

	msg "Installing icon and menu entry."
# using ${_gitname}.desktop, instead of ${pkgver}.desktop, because we need wixi.desktop, not wixi-git.desktop
	install -Dm644 ${startdir}/${_gitname}.desktop ${pkgdir}/usr/share/applications/${_gitname}.desktop
}
