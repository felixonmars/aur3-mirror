# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

# TODO: gst/interfaces/photography.h not found, also might need openal

pkgname=qt5-qtmultimedia-git
pkgver=20121023
pkgrel=1
pkgdesc="Qt 5: qtmultimedia module"
groups=('qt5' 'qt5-addons')
arch=('i686' 'x86_64')
url="https://qt.gitorious.org/qt/qtmultimedia"
license=('LGPL')
depends=('qt5-qtbase-git' 'qt5-qtxmlpatterns-git' 'qt5-qtdeclarative-git' 'qt5-qtjsbackend-git' 'gstreamer0.10' 'gstreamer0.10-base' 'pulseaudio' 'libpulse')
makedepends=('git')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://gitorious.org/qt/qtmultimedia.git"
_gitname=qt5-qtmultimedia

build() {
	if [ ! -d "${_gitname}" ]; then
		git clone ${_gitroot} ${_gitname} && cd ${_gitname}
	else
		cd ${_gitname} && git reset --hard && git pull origin && git clean -dfx
	fi

	msg "GIT checkout done."

	/opt/qt5/bin/qmake
	make
}

package() {
	cd "${_gitname}"

	make INSTALL_ROOT="${pkgdir}" install
}
