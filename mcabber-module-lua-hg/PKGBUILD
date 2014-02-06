# Maintainer: tuftedocelot@fastmail.fm
# Contributor: Nickolay Stepanenko <nixtrian at gmail dot com>
pkgname=mcabber-module-lua-hg
pkgver=146
pkgrel=1
pkgdesc="Lua interface module for mcabber. Adds '/lua' command (and much more in example scripts). Needs much more work, but already usable."
url="http://wiki.mcabber.com/index.php/Modules"
license=(GPL)
arch=('i686' 'x86_64')
depends=('mcabber>=0.10.0' 'lua-lm-hg')
makedepends=("cmake" "mercurial" "mcabber>=0.10.0")
_hgrepo="mcabber-lua"
md5sums=(SKIP)
source=("hg+http://hg.isbear.org.ua/isbear/${_hgrepo}")

pkgver() {
    cd $_hgrepo
    echo $(hg identify -n)
}

build() {
	cp -rf $srcdir/$_hgrepo $srcdir/$_hgrepo-build
	cd $srcdir/$_hgrepo-build
	cmake -DLUA_INCLUDE_DIR=/usr/include -DMCABBER_INCLUDE_DIR=/usr/include/mcabber -DCMAKE_INSTALL_PREFIX=/usr .
	make || return 1
}

package() {
    cd $srcdir/$_hgrepo-build
	DESTDIR=$pkgdir make install
}
