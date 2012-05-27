# Maintainer: Roger Zanoni <rogerzanoni@gmail.com>

pkgname=quasigame-qt4-git
pkgver=20120527
pkgrel=1
pkgdesc="Quasi Engine is a framework that intends to be a complete toolset to ease 2d game development, providing ready-to-use QML elements representing basic game entities needed by most of games."

arch=('i686' 'x86_64')
url="https://github.com/INdT/Quasi-Engine"
license=('LGPL')
depends=('qt>=4.7' 'box2d')
makedepends=('gcc' 'git' 'qt' 'box2d')

_gitroot="git@github.com:INdT/Quasi-Engine.git"
_gitname=Quasi-Engine

build() {
	cd "${srcdir}"

	if [ ! -d "${srcdir}/${_gitname}" ]; then
		git clone ${_gitroot}
	else
		cd ${_gitname} && git pull origin
	fi

	msg "GIT checkout done."

	cd "${srcdir}"
	cp -rf "${_gitname}" "${_gitname}-build"
	cd "${_gitname}-build"

	qmake
	make
}

package() {
	cd "${srcdir}/${_gitname}-build"

	make INSTALL_ROOT="${pkgdir}" install
}