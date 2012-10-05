# Maintainer: Sergio Correia <sergio.correia@uece.net>
# Contributor: Anselmo L. S. Melo <anselmolsm@gmail.com>

pkgname=qt5-qtwebkit-git
pkgver=20121005
pkgrel=1
pkgdesc="Qt 5: qtwebkit module"
groups=('qt5' 'qt5-addons')
arch=('i686' 'x86_64')
url="https://gitorious.org/qtwebkit/qt5-module"
license=('LGPL')
depends=('qt5-qtbase-git' 'qt5-qtdeclarative-git' 'qt5-qtlocation-git' 'qt5-qtsensors-git')
makedepends=('git' 'perl' 'gperf' 'fontconfig' 'udev')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://gitorious.org/qtwebkit/qt5-module.git"
_gitname=qt5-qtwebkit

build() {
	if [ ! -d "${_gitname}" ]; then
		git clone ${_gitroot} ${_gitname} && cd ${_gitname}
	else
		cd ${_gitname} && git reset --hard && git pull origin && git clean -dfx
	fi

	msg "GIT checkout done."

	Tools/Scripts/build-webkit --qt --qmake=/opt/qt5/bin/qmake --install-libs=/opt/qt5 --release
}

package() {
	cd "${_gitname}"

	make INSTALL_ROOT="${pkgdir}" -C WebKitBuild/Release install
}
