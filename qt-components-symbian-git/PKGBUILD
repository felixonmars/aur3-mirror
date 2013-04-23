# Contributor: Bernhard Friedreich <friesoft@gmail.com>
# Contributor: Tim Besard <tim.besard@gmail.com>

pkgname=qt-components-symbian-git
pkgver=20120105
pkgrel=1

pkgdesc="Research project to create Qt/QML components and models."
url="http://gitorious.org/qt-components"
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt4')
makedepends=('git')

provides=( "qt-components-git=${pkgver}" "qt-components=${pkgver}" )
conflicts=( "qt-components" )

#_gitroot="git://gitorious.org/qt-components/qt-components.git"
_gitroot="git://gitorious.org/~nahrstaedt/qt-components/archlinux-qt-components.git"
_gitname="qt-components-git"

build() {
    # Export the include dir
    export QTDIR="/usr"
    export INCLUDE="/usr/include"

    msg "Connecting to the GIT server..."
    if [ -d ${_gitname}/.git ]; then
        cd ${_gitname}
        git pull
    else
        git clone ${_gitroot} ${_gitname}
        cd ${_gitname}
    fi
    
    ./configure -symbian || return 1
    make || return 1
}

package () {
    cd ${_gitname}
    make INSTALL_ROOT=$pkgdir install || return 1
}

