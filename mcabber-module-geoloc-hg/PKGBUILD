# Contributor: Nickolay Stepanenko <nixtrian at gmail dot com>
pkgname=mcabber-module-geoloc-hg
replaces=mcabber-module-geoloc-git
provides=mcabber-module-geoloc-git
conflicts=mcabber-module-geoloc-git
pkgver=30
pkgrel=4
pkgdesc="Allows to see other's location and publish your. Provides '/geoloc' command. Requires 'pep' module. Also provides header file to allow other modules to publish information."
url="http://wiki.mcabber.com/index.php/Modules"
license=(GPL)
arch=('i686' 'x86_64')
depends=('mcabber>=0.10.0' 'mcabber-module-pep-hg') 
makedepends=("cmake" "mercurial" "mcabber>=0.10.0" 'mcabber-module-pep-hg')

_hgroot="http://hg.isbear.org.ua/isbear/"
_hgrepo="mcabber-geoloc"

build() {

   
	cp -rf $srcdir/$_hgrepo $srcdir/$_hgrepo-build
	


   msg "Building $pkgname ..."
	cd $srcdir/$_hgrepo-build
	
	cmake -DMCABBER_INCLUDE_DIR=/usr/include/mcabber -DCMAKE_INSTALL_PREFIX=/usr .
	make || return 1
	DESTDIR=$pkgdir make install

	rm -r $srcdir/$_hgrepo-build
}
