# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Adrian King Legaspi <aki.legaspi@gmail.com>

_pkgname=ghc
pkgname=ghc-git
pkgver=7.9.5532.g1c35f9f
pkgrel=1
pkgdesc="The Glasgow haskell compiler (git version)"
arch=('i686' 'x86_64')
url="https://github.com/ghc/ghc"
license=('custom')
depends=('perl' 'gmp' 'gcc')
makedepends=('ghc' 'perl' 'libxslt' 'docbook-xsl')
options=('staticlibs')
provides=('ghc')
conflicts=('ghc')
install='ghc-git.install'
source=("git://github.com/ghc/ghc.git"
    'build.mk')
md5sums=('SKIP'
         'b85e5aa31f42ef80f82b58a324200a31')


pkgver() {
    cd $_pkgname
    git describe --always | sed 's|-|.|g;s|ghc.||;s|start.||'
}

prepare() {
    cd ${srcdir}/$_pkgname
    ./sync-all get
}

build() {
    cd ${srcdir}/$_pkgname
    cp ${srcdir}/build.mk mk/build
    perl boot
    ./configure --prefix=/usr
    make
}

package() {
	cd ${srcdir}/$_pkgname
	make DESTDIR=${pkgdir} install
    install -d ${pkgdir}/usr/share/licenses/ghc
    install -m644 LICENSE \
    ${pkgdir}/usr/share/licenses/ghc
}
