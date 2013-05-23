# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=communi-git
pkgver=20130514
pkgrel=1
pkgdesc="A cross-platform IRC framework written with Qt"
arch=('i686' 'x86_64')
url="https://github.com/communi/communi"
license=('LGPL2.1')
depends=('qt5-base-git')
makedepends=('gcc' 'git')

_gitroot="git://github.com/communi/communi.git"
_gitname=communi
_gitbranch=master

build() {
	if [ ! -d "${_gitname}" ]; then
		git clone -b ${_gitbranch} --depth 1 ${_gitroot} ${_gitname} && cd ${_gitname}
	else
		cd ${_gitname} && git reset --hard && git pull origin && git clean -dfx
	fi

	msg "GIT checkout done."

	./configure -prefix /usr -headerdir /usr/include/communi -featuredir /usr/lib/qt/mkspecs/features
	make
}

package() {
	cd "${_gitname}"

	make INSTALL_ROOT="${pkgdir}" install
}
