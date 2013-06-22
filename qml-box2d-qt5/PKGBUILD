# Maintainer: Zsuro Tibor <zsurotibor@gmail.com>

pkgname=qml-box2d-qt5
pkgver=20130622.2
pkgrel=1
pkgdesc="QML bindings to the Box2D physics library for Qt5"
arch=('i686' 'x86_64')
url="https://github.com/bjorn/qml-box2d.git"
license=('LGPL')
depends=('qt5-base' 'qt5-declarative')
makedepends=('qt5-base' 'git')
source=()
md5sums=()

_gitroot="https://github.com/bjorn/qml-box2d.git"
_gitname=qml-box2d

build() {
	cd "${srcdir}"
	
	if [ ! -d "${srcdir}/${_gitname}" ]; then
		git clone ${_gitroot}
	else
		cd ${_gitname} && git pull origin
	fi
	
	cd ${_gitname} && git checkout qt5
	
	msg "GIT checkout done."

	cd "${srcdir}"
	cp -rf "${_gitname}" "${_gitname}-build"
	cd "${_gitname}-build"
	
	qmake-qt5
	make
}

package() {
	cd "${srcdir}/${_gitname}-build"
	
	make INSTALL_ROOT="${pkgdir}" install
}
