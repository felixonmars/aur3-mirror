# Mantainer: aleixpol@kde.org

pkgname=kanban-git
_pkgname=kanban
pkgver=20100808
pkgrel=1
pkgdesc="A sync'able task management application that works everywhere"
url="http://gitorious.org/kanban/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'git' 'automoc4')
conflicts=('kanban')

_gitroot='git://gitorious.org/kanban/mainline.git'
_gitname='kanban'

build() {
    cd "$srcdir"
    msg "Connecting to gitorious GIT server...."
    if [ -d ${srcdir}/$_gitname ] ; then
        cd $_gitname
        git pull . master
        git submodule update --init
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
        cd $_gitname
        git submodule update --init
    fi
    msg "GIT checkout done."

    cd ..
    if [ -d build ] ; then
        rm -rf build
    fi
    mkdir build
    cd build
    cmake ${srcdir}/$_gitname \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release || return 1
    make || return 1
    make DESTDIR=$startdir/pkg install
}

