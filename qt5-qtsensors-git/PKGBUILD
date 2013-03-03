# Maintainer: Sergio Correia <sergio.correia@uece.net>

pkgname=qt5-qtsensors-git
pkgver=20130303
pkgrel=1
pkgdesc="Qt 5: qtsensors module"
groups=('qt5' 'qt5-addons')
arch=('i686' 'x86_64')
url="https://qt.gitorious.org/qt/qtsensors"
license=('LGPL')
depends=('qt5-qtbase-git')
makedepends=('git')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://gitorious.org/qt/qtsensors.git"
_gitname=qt5-qtsensors
_gitbranch=dev

build() {
    if [ ! -d "${_gitname}" ]; then
        git clone -b ${_gitbranch} --depth 1 ${_gitroot} ${_gitname} && cd ${_gitname}
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
