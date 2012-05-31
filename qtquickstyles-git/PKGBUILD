# Maintainer: Mailson D. Lira Menezes <mailson@gmail.com>

pkgname=qtquickstyles-git
pkgver=20120528
pkgrel=1
pkgdesc="Qt Quick 2 desktop components and styles (experimental)"
arch=('i686' 'x86_64')
url="http://wiki.qtlabs.org.br/projects/qtquickstyles/Main"
license=('LGPL')
depends=('qt5-qtdeclarative-git')
makedepends=('gcc' 'git')
source=()
md5sums=()

_gitroot="git://code.openbossa.org/projects/qtquickstyles.git"
_gitname=qtquickstyles

build() {
	cd "${srcdir}"

	if [ ! -d "${srcdir}/${_gitname}" ]; then
		git clone ${_gitroot} ${_gitname}
	else
		cd ${_gitname} && git pull origin
	fi

	msg "GIT checkout done."

	cd "${srcdir}"
	cp -rf "${_gitname}" "${_gitname}-build"
	cd "${_gitname}-build"
    
    /opt/qt5/bin/qmake
    make
}

package() {
	cd "${srcdir}/${_gitname}-build"
	make INSTALL_ROOT="${pkgdir}" install
}
