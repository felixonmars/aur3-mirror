# Maintainer: Perry3D <perry3d at googlemail dot com>
# Contributor: Ralf Barth <archlinux dot or at haggy dot org>

pkgname=xbmc-skin-aeon65-git
pkgver=20100607
pkgrel=1
pkgdesc="Aeon skin (temmi2000 mod, aka. Aeon65) for XBMC (git version)"
arch=('i686' 'x86_64')
url="http://xbmc.org/forum/showthread.php?t=55600"
source=('http://dump.haggy.org/aur/aeon65-fonts.rar')
md5sums=('a4b69e2a0f7444f6228d274dff14580f')
noextract=()
depends=('xbmc')
makedepends=('git' 'unrar')
provides=()
groups=('multimedia')
license=('GPL')
options=()
source=('addon.xml' 'recentlyAdded.patch')
md5sums=('db881ed7eb4531c1fe7ff96ebc643cab'
         '8739b5bb402d22b51b2a0e7c8cb3db3d')

_gitroot="git://github.com/temmi2000/aeon.git"
_gitname="skin.aeon65"

build() {

	msg "Connecting to GIT server...."

	if [ -d $srcdir/$_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"


	# Copy tree to share location
	mkdir -p $pkgdir/usr/share/xbmc/addons
	cp -r $srcdir/$_gitname $pkgdir/usr/share/xbmc/addons/
	cp $srcdir/addon.xml $pkgdir/usr/share/xbmc/addons/$_gitname/

	#Patching for the new recentlyAdded script
	patch $pkgdir/usr/share/xbmc/addons/skin.aeon65/720p/Home.xml $srcdir/recentlyAdded.patch
}

