# Contributor: Nickolay Stepanenko <nixtrian at gmail dot com>
# Maintainer: tuftedocelot@fastmail.fm

pkgname=mcabber-module-urlopen-hg
pkgver=35
pkgrel=1
pkgdesc='A small module allowing to open urls by "/url open" command'
url="http://wiki.mcabber.com/index.php/Modules"
license=(GPL)
arch=('i686' 'x86_64')
depends=('mcabber>=0.10.0')
makedepends=("cmake" "mercurial" "mcabber>=0.10.0")

install="urlopen.install"

_hgroot="http://hg.isbear.org.ua/isbear/"
_hgrepo="mcabber-urlopen"

md5sums=(SKIP)
source=("hg+http://hg.isbear.org.ua/isbear/${_hgrepo}")

pkgver() {
    cd $_hgrepo
    echo $(hg identify -n)
}

build() {
	cp -rf $srcdir/$_hgrepo $srcdir/$_hgrepo-build
    
    msg "Building $pkgname ..."
	
    cd $srcdir/$_hgrepo-build
	sed 's/.api         = 20,/.api         = 21,/' -i urlopen.c
	cmake -DMCABBER_INCLUDE_DIR=/usr/include/mcabber -DCMAKE_INSTALL_PREFIX=/usr .
	make || return 1
}
package() {    
    cd $srcdir/$_hgrepo-build
    DESTDIR=$pkgdir make install
}
