# Contributor: Nickolay Stepanenko <nixtrian at gmail dot com>
pkgname="mcabber-module-ping-git"
pkgver=20091109
pkgrel=1
pkgdesc="Provides '/ping' command to send xmpp ping messages and display time taken for response. "
url="http://wiki.mcabber.com/index.php/Modules"
license=(GPL)
arch=('i686' 'x86_64')
depends=('mcabber>=0.10.0')
makedepends=("cmake" "git" "mcabber>=0.10.0")

_gitroot="http://isbear.unixzone.org.ua/source/mcabber-ping"
_gitname="mcabber-ping"

build() {
	cd $srcdir

   msg "Connecting to $_gitroot ..."
	if [ -d $srcdir/$_gitname ] ; then
		cd $_gitname && git pull
		msg "The local files are updated."
	  else
		git clone $_gitroot
	fi
	
   msg "GIT checkout done or server timeout"
   
	cp -rf $srcdir/$_gitname $srcdir/$_gitname-build
	


   msg "Building $pkgname ..."
	cd $srcdir/$_gitname-build
	
	cmake -DMCABBER_INCLUDE_DIR=/usr/include/mcabber -DCMAKE_INSTALL_PREFIX=/usr .
	make || return 1
	DESTDIR=$pkgdir make install

	rm -r $srcdir/$_gitname-build
}
