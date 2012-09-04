# Maintainer: Anselmo L. S. Melo <anselmolsm@gmail.com>

pkgname=qt-base-git
pkgver=20120904
pkgrel=1
pkgdesc="Qt 5: qtbase module"
groups=('qt5' 'qt5-essentials')
arch=('i686' 'x86_64')
url="https://qt.gitorious.org/qt/qtbase"
license=('LGPL')
depends=('xcb-util-image' 'xcb-util-wm')
makedepends=('git')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://gitorious.org/qt/qtbase.git"
_gitname=qtbase

build() {
	. ../qt.profile
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
    ./configure -nomake demos -nomake tests -nomake examples --prefix=/opt/qt5 -opensource --confirm-license
    make
}

package() {
	install -Dm755 "../qt.profile" "${pkgdir}"/etc/profile.d/qt5.sh

	cd "${srcdir}/${_gitname}-build"

	make INSTALL_ROOT="${pkgdir}" install
}
