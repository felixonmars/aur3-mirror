# Maintainer: C Anthony Risinger
pkgname=pywebkitgtk-pythonwebkit
pkgver=20101115
pkgrel=1
pkgdesc="Python bindings to the [python]WebKit GTK+ port"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pywebkitgtk/"
license=('LGPL')
depends=('libpythonwebkit-python2' 'pygtk')
options=('!libtool' '!makeflags')
source=()
md5sums=()

_gitroot='git://github.com/lkcl/pywebkitgtk.git'
_gitname='pythonwebkitgtk_1_1_8'

build() {

    local g=${startdir}/${pkgname}.git w=${srcdir}
    if ! [ -d "${g}" ]; then
        git --git-dir=${g} --work-tree=${w} init
    fi  

    msg2 "Syncing with ${_gitroot}..."
    git --git-dir=${g} --work-tree=${w} fetch -fu ${_gitroot} +${_gitname}:${_gitname}
    msg2 "Initializing src tree..."
    git --git-dir=${g} --work-tree=${w} read-tree --reset -u ${_gitspec:-${_gitname}}

    export PYTHON=/usr/bin/python2
    [ -d build ] && rm -rf build
    mkdir build
    cd build

    msg2 "Building branch: origin/${_gitname}..."
    ../autogen.sh --prefix=/usr

    make

}

package() {

    cd build
    make DESTDIR=${pkgdir} install

}
