# Contributor: Nickolay Stepanenko <nixtrian at gmail dot com>
pkgname=mcabber-module-mood-hg
replaces=mcabber-module-mood-git
provides=mcabber-module-mood-git
conflicts=mcabber-module-mood-git
pkgver=24
pkgrel=4
pkgdesc="Allows to see mood changes of other buddies and publish your. Adds '/mood' command."
url="http://wiki.mcabber.com/index.php/Modules"
license=(GPL)
arch=('i686' 'x86_64')
depends=('mcabber-hg' 'mcabber-module-pep-hg')
makedepends=("cmake" "mercurial" "mcabber-hg" 'mcabber-module-pep-hg')

_hgroot="http://hg.isbear.org.ua/isbear/"
_hgrepo="mcabber-mood"

build() {

   
	cp -rf $srcdir/$_hgrepo $srcdir/$_hgrepo-build
	


   msg "Building $pkgname ..."
	cd $srcdir/$_hgrepo-build
	
	cmake -DMCABBER_INCLUDE_DIR=/usr/include/mcabber -DCMAKE_INSTALL_PREFIX=/usr .
	make || return 1
	DESTDIR=$pkgdir make install

	rm -r $srcdir/$_hgrepo-build
}
