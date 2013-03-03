# Maintainer: Sergio Correia <sergio.correia@uece.net>

pkgname=qt5-qtimageformats-git
pkgver=20130303
pkgrel=1
pkgdesc="Qt 5: qtimageformats module"
arch=('i686' 'x86_64')
url="https://qt.gitorious.org/qt/qtimageformats"
license=('LGPL')
depends=('libtiff' 'libmng')
makedepends=('gcc' 'git' 'qt5-qtbase-git')

_gitroot="git://gitorious.org/qt/qtimageformats.git"
_gitname=qt5-qtimageformats
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
