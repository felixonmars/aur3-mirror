# Contributor: Nickolay Stepanenko <nixtrian at gmail dot com>
pkgname=mcabber-module-tune-hg
replaces=mcabber-module-tune-git
provides=mcabber-module-tune-git
conflicts=mcabber-module-tune-git
pkgver=36
pkgrel=4
pkgdesc="Allows to see music, that buddy listens to, and publish your own. Right now you can use '/tune' command through fifo to update your published tune, but this module also provides means to do this from other modules, and soon there should be mpd module, that will use it. "
url="http://wiki.mcabber.com/index.php/Modules"
license=(GPL)
arch=('i686' 'x86_64')
depends=('mcabber>=0.10.0' 'mcabber-module-pep-hg')
makedepends=("cmake" "mercurial" "mcabber>=0.10.0"  'mcabber-module-pep-hg')

_hgroot="http://hg.isbear.org.ua/isbear/"
_hgrepo="mcabber-tune"

build() {

   
	cp -rf $srcdir/$_hgrepo $srcdir/$_hgrepo-build
	


   msg "Building $pkgname ..."
	cd $srcdir/$_hgrepo-build
	
	cmake -DMCABBER_INCLUDE_DIR=/usr/include/mcabber -DCMAKE_INSTALL_PREFIX=/usr .
	make || return 1
	DESTDIR=$pkgdir make install

	rm -r $srcdir/$_hgrepo-build
}
