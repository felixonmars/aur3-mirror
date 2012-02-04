# Contributor: Alexander Drozdov <adrozdoff@gmail.com>

pkgname=qtcreator-cpphelper-plugin-opt-git
pkgver=20101112
pkgrel=2
pkgdesc="Collection of actions to improve productivity while writing code"
arch=('i686' 'x86_64')
url="http://gitorious.org/creator-plugins"
license=('LGPL')
depends=('qt-opt-git' 'qtcreator-opt-git')
makedepends=('git')
source=(crash-fix.diff)
options=(!strip)

#_gitroot="http://git.gitorious.org/~h4tr3d/creator-plugins/h4tr3d-cpphelper.git"
_gitroot="http://git.gitorious.org/creator-plugins/cpphelper.git"
_gitname="cpphelper"
_gitroot_creator="git://gitorious.org/qt-creator/qt-creator.git"
_gitname_creator="qt-creator"

build() {

    #
    # Get Qt Creator
    #

    cd ${startdir}/src
    msg "Connecting to GIT server for fetch qt-creator"
    if [ -d ${srcdir}/$_gitname_creator ] ; then
        cd ${srcdir}/$_gitname_creator && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot_creator $_gitname_creator
    fi
    msg "GIT checkout done or server timeout"

    if [ -d ${srcdir}/$_gitname_creator-build ]; then
        rm -rf ${srcdir}/$_gitname_creator-build
    fi

    # use shadow build
    mkdir ${srcdir}/$_gitname_creator-build
    cd ${srcdir}/$_gitname_creator-build
    /opt/qt-git/bin/qmake ${srcdir}/${_gitname_creator}/qtcreator.pro

    # Generate some files
    make src/Makefile
    make -C src plugins/Makefile
    make -C src/plugins coreplugin/Makefile

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

    #export CREATORDIR=/opt/qtcreator-git/
    #export CREATORSRC=${srcdir}/${_gitname_creator}/
    export QTC_SOURCE=${srcdir}/${_gitname_creator}/
    export QTC_BUILD=/opt/qtcreator-git/

    # fix plugins copy targets
    sed -i 's|IDE_BUILD_TREE = $$(QTC_BUILD)|IDE_BUILD_TREE = ./|' cpphelper.pro

    /opt/qt-git/bin/qmake \
	INCLUDEPATH+=${srcdir}/${_gitname_creator}-build/src/plugins/coreplugin \
	LIBS+=-L${QTC_BUILD}/lib/qtcreator \
	LIBS+=-L${QTC_BUILD}/lib/qtcreator/plugins \
	LIBS+=-L${QTC_BUILD}/lib/qtcreator/plugins/Nokia \
	cpphelper.pro
    patch -p0 < ${srcdir}/crash-fix.diff
    make

    PLUGINS_DIR=/lib/qtcreator/plugins/CreatorPlugins
    install -m 755 -d ${pkgdir}/opt/qtcreator-git/${PLUGINS_DIR}
    install -m 644 ./${PLUGINS_DIR}/CppHelper.pluginspec ${pkgdir}/opt/qtcreator-git/${PLUGINS_DIR}/
    install -m 755 ./${PLUGINS_DIR}/libCppHelper.so      ${pkgdir}/opt/qtcreator-git/${PLUGINS_DIR}/

    # fix depend
    sed -i 's|2.0.93|2.1.81|g' ${pkgdir}/opt/qtcreator-git/${PLUGINS_DIR}/CppHelper.pluginspec
}
md5sums=('ba8b6e372217521c000e2db7800669e7')
