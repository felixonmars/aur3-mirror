# Maintainer: Sergio Correia <sergio.correia@uece.net>
# Contributor: Anselmo L. S. Melo <anselmolsm@gmail.com>

pkgname=qt5-qtbase-git
pkgver=20130303
pkgrel=1
pkgdesc="Qt 5: qtbase module"
arch=('i686' 'x86_64')
url="https://qt.gitorious.org/qt/qtbase"
license=('LGPL')
depends=('gtk2' 'libmysqlclient' 'unixodbc' 'libfbclient' 'postgresql-libs' 'sqlite' 'libxrender' 'xcb-util-wm' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm' 'mesa')
makedepends=('git' 'udev')
options=('!libtool')

_gitroot="git://gitorious.org/qt/qtbase.git"
_gitname=qt5-qtbase
_gitbranch=dev

build() {
    if [ ! -d "${_gitname}" ]; then
        git clone -b ${_gitbranch} --depth 1 ${_gitroot} ${_gitname} && cd ${_gitname}
    else
        cd ${_gitname} && git reset --hard && git pull origin && git clean -dfx
    fi

    msg "GIT checkout done."
    ./configure --prefix=/opt/qt5 -nomake demos -nomake tests -nomake examples -release -no-rpath -opensource --confirm-license
    make
}

package() {
    cd "${_gitname}"

    make INSTALL_ROOT="${pkgdir}" install
}
