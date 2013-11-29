# Maintainer: Adrien Sohier <adrien.sohier@art-software.fr>

pkgname=visound-git
_gitname=visound
_gitrepo="http://towncraft.art-software.fr/projects"
pkgver=0.1.4.beta
pkgrel=2
pkgdesc="Modular Sound Visualizer"

arch=('i686' 'x86_64')
url="http://www.art-software.fr"
license=(GPLv3)
source=("git+${_gitrepo}/${_gitname}.git")
md5sums=(SKIP)

depends=('sdl<1.3' 'sdl_gfx')
makedepends=('git')


build() {
	cd ${srcdir}/${_gitname}
	git checkout $(git tag|sort -V|tail -1)
	sed -i "s@LDFLAGS+=@LDFLAGS=@" Makefile
	make mrproper && make
}

pkgver() {
	cd ${srcdir}/${_gitname}
	git tag|sort -V|tail -1|tr "-" "."|sed "s@^v@@"
}

package() {
	cd ${srcdir}/${_gitname}
	install -dm755 ${pkgdir}/usr/bin
	install -m755 vs ${pkgdir}/usr/bin/ || install -m755 visound ${pkgdir}/usr/bin/
}
