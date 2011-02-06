# Contributor: Alexander Drozdov <adrozdoff@gmail.com>

pkgname=qtcreator-todo-plugin-opt-git
pkgver=20100827
pkgrel=2
pkgdesc="Collection of actions to improve productivity while writing code"
arch=('i686' 'x86_64')
url="http://gitorious.org/creator-plugins"
license=('BSD')
depends=('qt-opt-git' 'qtcreator-opt-git')
makedepends=('git')
source=()

_gitroot="http://git.gitorious.org/~h4tr3d/qt-creator-todo-plugin/h4tr3d-qt-creator-todo-plugin.git"
_gitname="todo-plugin"
_gitroot_creator="git://gitorious.org/qt-creator/qt-creator.git"
_gitname_creator="qt-creator"

build() {

    #
    # Get Qt Creator
    #

    cd ${startdir}/src
    msg "Connecting to GIT server for fetch qt-creator"
    if [ -d ${srcdir}/$_gitname_creator ] ; then
        cd ${srcdir}/$_gitname_creator && git pull origin || return 1
        msg "The local files are updated."
    else
        git clone $_gitroot_creator $_gitname_creator || return 1
    fi
    msg "GIT checkout done or server timeout"

    #
    # Build CppHelper Plugin
    #
    cd ${startdir}/src
    msg "Connecting to GIT server for fetch plugins"
    if [ -d ${srcdir}/$_gitname ] ; then
        cd ${srcdir}/$_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi
    msg "GIT checkout done or server timeout"

    if [ -d ${srcdir}/$_gitname-build ]; then
        rm -rf ${srcdir}/$_gitname-build
    fi
    cp -a ${srcdir}/$_gitname ${srcdir}/$_gitname-build
    cd ${srcdir}/$_gitname-build

    export CREATORDIR=/opt/qtcreator-git
    export CREATORSRC=${srcdir}/${_gitname_creator}/

    /opt/qt-git/bin/qmake
    make

    PLUGINS_DIR=/lib/qtcreator/plugins/vsorokin
    install -m 755 -d ${pkgdir}/opt/qtcreator-git/${PLUGINS_DIR}
    install -m 644 ./${PLUGINS_DIR}/todo.pluginspec ${pkgdir}/opt/qtcreator-git/${PLUGINS_DIR}/
    install -m 755 ./${PLUGINS_DIR}/libtodo.so      ${pkgdir}/opt/qtcreator-git/${PLUGINS_DIR}/
    install -m 755 -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -m 644 ./LICENSE.BSD ${pkgdir}/usr/share/licenses/${pkgname}/
}

md5sums=()
