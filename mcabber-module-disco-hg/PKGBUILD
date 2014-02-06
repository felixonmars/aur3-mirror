# Maintainer: tuftedocelot@fastmail.fm
# Contributor: Nickolay Stepanenko <nixtrian at gmail dot com>
pkgname=mcabber-module-disco-hg
pkgver=62
pkgrel=1
pkgdesc="Module adds '/disco' command, that sends service discovery requests."
url="http://wiki.mcabber.com/index.php/Modules"
license=(GPL)
arch=('i686' 'x86_64')
depends=('mcabber>=0.10.0')
makedepends=("cmake" "mercurial" "mcabber>=0.10.0")
_hgrepo="mcabber-disco"
md5sums=(SKIP)
source=("hg+http://hg.isbear.org.ua/isbear/${_hgrepo}")

pkgver() {
    cd $_hgrepo
    echo $(hg identify -n)
}

build() {
	cp -rf $srcdir/$_hgrepo $srcdir/$_hgrepo-build
	cd $srcdir/$_hgrepo-build
	
	cmake -DMCABBER_INCLUDE_DIR=/usr/include/mcabber -DCMAKE_INSTALL_PREFIX=/usr .
	make || return 1
}

package() {
    cd $srcdir/$_hgrepo-build
	DESTDIR=$pkgdir make install
}
