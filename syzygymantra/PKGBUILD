#Maintainer Jonathan Fine (were.Vire_AT_gmail_DOT_com)

pkgname=syzygymantra
pkgver=1.0.0
pkgrel=1
pkgdesc='Mantra is an overhead style adventure game inspired by Zelda for the NES. It was originally created for Mac OS 7, but is being rewritten for Mac OS X and Windows.'
arch=('i686' 'x86_64')
url='http://www.syzygycult.com/'
license=('GPL')
depends=('alfont' 'dumb')
makedepends=('svn')
source=('Makefile' 'mantra.patch')
md5sums=('f00b3957a3dbf6692d130c806018b957'
         '1314bc3d99b6d7dcbc3b8dbc9fb3f52d')

build() {
	cd $srcdir || return 1
	
	#We only want the souce code and the data files. The original coder put a whole bunch of libs that we dont want in the svn tree
	svn co https://syzygymantra.svn.sourceforge.net/svnroot/syzygymantra/src syzygymantra/src || return 1
	svn co https://syzygymantra.svn.sourceforge.net/svnroot/syzygymantra/dats syzygymantra/dats || return 1
	
	#With these libs came their headers, but we do not want to mix old and new library headers, so not all the headers are copied from the tree. In order to do this, we need to copy them individually.
	mkdir -p syzygymantra/include
	svn cat https://syzygymantra.svn.sourceforge.net/svnroot/syzygymantra/include/GameDefines.h > syzygymantra/include/GameDefines.h || return 1
	svn cat https://syzygymantra.svn.sourceforge.net/svnroot/syzygymantra/include/GameTypes.h > syzygymantra/include/GameTypes.h || return 1

	cd syzygymantra || return 1
	patch -p0 < $srcdir/mantra.patch || return 1
	mv $srcdir/Makefile ./ || return 1
	
	make || return 1
	
	#copy the data files to /usr/share... we dont want them in /usr/bin
	install -Dm755 mantra $pkgdir/usr/bin/syzygymantra || return 1
	install -Dm644 dats/GameData.dat $pkgdir/usr/share/syzygymantra/GameData.dat || return 1
	install -Dm644 dats/Images.dat $pkgdir/usr/share/syzygymantra/Images.dat || return 1
	install -Dm644 dats/Music.dat $pkgdir/usr/share/syzygymantra/Music.dat || return 1
	install -Dm644 dats/Saved.dat $pkgdir/usr/share/syzygymantra/Saved.dat || return 1
	install -Dm755 dats/Sound.dat $pkgdir/usr/share/syzygymantra/Sound.dat || return 1
}
