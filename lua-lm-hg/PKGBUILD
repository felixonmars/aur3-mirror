pkgname="lua-lm-hg"
pkgver=55
pkgrel=1
pkgdesc='Lua module to work with loudmouth'
url="http://wiki.mcabber.com/index.php/Modules"
license=(GPL)
arch=('i686' 'x86_64')
depends=('lua' 'loudmouth')
makedepends=("mercurial")
provides=('lua-lm')
source=("hg+http://hg.lilotux.net/lua-lm/")
md5sums=(SKIP)
_hgrepo="lua-lm"

pkgver() {
    cd "${srcdir}/${_hgrepo}"
    hg identify -n
}

build() {
	mkdir $srcdir/$_hgrepo-build || true
	cd $srcdir/$_hgrepo-build
	
	cmake -DMCABBER_INCLUDE_DIR=/usr/include/mcabber -DCMAKE_INSTALL_PREFIX=/usr ../$_hgrepo
	make || return 1
}

package() {
    cd $srcdir/$_hgrepo-build
	DESTDIR=$pkgdir make install
}
