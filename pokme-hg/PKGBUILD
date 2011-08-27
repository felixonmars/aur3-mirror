# Maintainer: Duologic	

pkgname="pokme-hg"
pkgver=584
pkgrel=1
pkgdesc="The latest hg pull of pokme, an online poker client."
url="http://pok.me/"
license=("GPL3")
arch=("i686" "x86_64")
depends=("openscenegraph" "unittestpp")
makedepends=("mercurial" "inkscape" "blender" "bc")
provides=("pokme")
conflicts=("pokme")
source=("CC.patch" "unittest.patch")
md5sums=("0d53353d6d2bee62e57c62d9249088c9" 
         "2cbeb130ab0f73a8c362a4063658626d")

_hgroot="http://hg.pok.me"
_hgrepo="pokme"

build() {
	patch -Np1 -i ${startdir}/CC.patch
	patch -Np1 -i ${startdir}/unittest.patch
	
	cd ${srcdir}/${_hgrepo}
	./configure --prefix=/usr
	
	cd debug
	_flags=("PREFIX=/usr" "ETC=/etc" "DESTDIR=${pkgdir}")
	make ${_flags[@]} || return 1
	make ${_flags[@]} install || return 1
}
