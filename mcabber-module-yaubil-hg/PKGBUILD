# Maintainer: tuftedocelot@fastmail.fm
# Contributor: Nickolay Stepanenko <nixtrian at gmail dot com>

pkgname=mcabber-module-yaubil-hg
pkgver=34
pkgrel=1
pkgdesc="Yet Another Useless Built-In Language. Provides '/eval', '/if', '/then', '/else', '/let' and '/multi' commands."
url="http://wiki.mcabber.com/index.php/Modules"
license=(GPL)
arch=('i686' 'x86_64')
depends=('mcabber-hg' 'mcabber-module-pep-hg')
makedepends=("cmake" "mercurial" "mcabber-hg")

_hgrepo="mcabber-yaubil"

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
