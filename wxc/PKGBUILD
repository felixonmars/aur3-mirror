# Current maintainer: Peter Enerccio <enerccio@gmail.com> 
 
pkgname=wxc
pkgver=latest
pkgrel=git
pkgdesc="wxWidgets c bindings"
arch=('i686' 'x86_64')
url="http://www.haskell.org/haskellwiki/WxHaskell"
license=('wxWidgets license')
depends=('wxgtk')
makedepends=('cabal-install' 'git')
provides=('wxc')
conflicts=()
options=('!makeflags' '!strip')
_gitcmd=https://github.com/jodonoghue/wxHaskell.git
_gitrepo=wxHaskell
source=('eljpen.cpp.patch')
md5sums=('d1c361a41e7996a9792dedd02a739fc5')

build() {
	cd $srcdir
	mkdir -p ${srcdir}/tmp

	git clone ${_gitcmd}
	cd $srcdir/${_gitrepo}/wxc/
	
	patch -Ni${srcdir}/eljpen.cpp.patch src/cpp/eljpen.cpp

	cabal install --prefix=${srcdir}/tmp
}

package () {
	mkdir -p ${pkgdir}/usr
	mkdir -p ${pkgdir}/usr/lib
	mkdir -p ${pkgdir}/usr/include
	mkdir -p ${pkgdir}/usr/include/wxc
	cd $srcdir
	cp ${srcdir}/tmp/lib/wxc-0.90.0.4/ghc-7.6.1/libwxc.so ${pkgdir}/usr/lib
	cp ${srcdir}/tmp/lib/wxc-0.90.0.4/ghc-7.6.1/include/* ${pkgdir}/usr/include/wxc -r
	cp ${srcdir}/tmp/share ${pkgdir}/usr/ -r
}
