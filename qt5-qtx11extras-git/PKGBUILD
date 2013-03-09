# Maintainer: Sergio Correia <sergio.correia@uece.net>
# Contributor: Anselmo L. S. Melo <anselmolsm@gmail.com>

pkgname=qt5-qtx11extras-git
pkgver=20130309
pkgrel=1
pkgdesc="Qt 5: qtx11extras module"
groups=('qt5' 'qt5-addons')
arch=('i686' 'x86_64')
url="https://qt.gitorious.org/qt/qtx11extras"
license=('LGPL')
depends=('qt5-qtbase-git')
makedepends=('git')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://gitorious.org/qt/qtx11extras.git"
_gitname=qt5-qtx11extras
_gitbranch=master # There is no dev branch yet

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
