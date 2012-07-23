# Contributor: Nickolay Stepanenko <nixtrian at gmail dot com>
pkgname=mcabber-module-activity-hg
replaces=mcabber-module-activity-git
provides=mcabber-module-activity-git
conflicts=mcabber-module-activity-git
pkgver=31
pkgrel=4
pkgdesc='Allows to see others activity and publish your. Provides /activity command. Requires pep module.'
url="http://wiki.mcabber.com/index.php/Modules"
license=(GPL)
arch=('i686' 'x86_64')
depends=('mcabber>=0.10.0' 'mcabber-module-pep-hg')
makedepends=("cmake" "mercurial" "mcabber>=0.10.0" 'mcabber-module-pep-hg')

_hgroot="http://hg.isbear.org.ua/isbear/"
_hgrepo="mcabber-activity"

build() {

   
	cp -rf $srcdir/$_hgrepo $srcdir/$_hgrepo-build
	


   msg "Building $pkgname ..."
	cd $srcdir/$_hgrepo-build
	
	touch ./activity.avv.in
	cmake -DMCABBER_INCLUDE_DIR=/usr/include/mcabber -DCMAKE_INSTALL_PREFIX=/usr .

	make || return 1
	DESTDIR=$pkgdir make install

	rm -r $srcdir/$_hgrepo-build
}
