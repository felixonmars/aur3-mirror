# Maintainer: Sergio Correia <sergio.correia@uece.net>

pkgname=qt5-qt3d-git
pkgver=20130303
pkgrel=1
pkgdesc="Qt 5: qt3d module"
groups=('qt5' 'qt5-addons')
arch=('i686' 'x86_64')
url="https://qt.gitorious.org/qt/qt3d"
license=('LGPL')
depends=('qt5-declarative')
makedepends=('git')
options=('!libtool')
source=('qt3d-undefined-reference-workaround.patch')
md5sums=('3f76933d3922cc2ea7be24da044c0d9d')

_gitroot="git://gitorious.org/qt/qt3d.git"
_gitname=qt5-qt3d
_gitbranch=master

build() {
    if [ ! -d "${_gitname}" ]; then
        git clone ${_gitroot} -b ${_gitbranch} --depth 1 ${_gitname} && cd ${_gitname}
    else
        cd ${_gitname} && git reset --hard && git pull origin && git clean -dfx
    fi

    msg "GIT checkout done."

    patch -uNp1 -i ../qt3d-undefined-reference-workaround.patch
    /opt/qt5/bin/qmake
    make
}

package() {
    cd "${_gitname}"

    make INSTALL_ROOT="${pkgdir}" install
}
