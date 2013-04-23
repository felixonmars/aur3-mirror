# Contributor: Holger Nahrstaedt <holgernahrstaedt@gmx.de>

pkgname=qt-components-meego-git
_gitname="archlinux-qt-components"
pkgver=2c3eca0
pkgrel=1

pkgdesc="Research project to create Qt/QML components and models."
url="http://gitorious.org/qt-components"
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt4')
makedepends=('git')

provides=( "qt-components-git=${pkgver}" "qt-components=${pkgver}" )
conflicts=( "qt-components" )

source=('git://gitorious.org/~nahrstaedt/qt-components/archlinux-qt-components.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
    # Export the include dir
    export QTDIR="/usr"
    export INCLUDE="/usr/include"

    cd $_gitname
    
    ./configure -meego || return 1
    make || return 1
}

package () {
    cd ${_gitname}
    make INSTALL_ROOT=$pkgdir install || return 1
}

