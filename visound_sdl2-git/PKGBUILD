# Maintainer: Adrien Sohier <adrien.sohier@art-software.fr>

pkgname=visound_sdl2-git
_gitname=visound
_gitrepo="http://git.art-software.fr/git"
pkgver=0.2.0
pkgrel=1
pkgdesc="Modular Sound Visualizer"

arch=('i686' 'x86_64' 'armv6h')
url="http://www.art-software.fr/index.php"
license=(GPLv3)
source=("git+${_gitrepo}/${_gitname}.git")
md5sums=(SKIP)

depends=('sdl2>2.0')
makedepends=('git')
conflicts=('visound_sdl-git' 'visound_sfml-git')


build() {
	cd ${srcdir}/${_gitname}
	mkdir build

	pushd build &&
	cmake .. -DCMAKE_BUILD_TYPE=Release -DBACKEND=SDL2 &&
	make clean &&
	make &&
	popd
}

pkgver() {
	cd ${srcdir}/${_gitname}
	git describe|cut -d'-' -f1,3|sed "s@^v@@"
}

package() {
	cd ${srcdir}/${_gitname}
	install -dm755 ${pkgdir}/usr/bin
	install -dm755 ${pkgdir}/usr/share/man/man1

	install -m755 bin/vs ${pkgdir}/usr/bin/
	install -m644 doc/man/vs.1 ${pkgdir}/usr/share/man/man1/
}
