# Contributor: Giedrius Slavinskas <giedrius25@gmail.com>
# Contributor: Techlive Zheng <techlivezheng@gmail.com>

pkgname=gaphas-git
pkgver=20120623
pkgrel=1
pkgdesc="A GTK+ based diagramming widget written in Python"
arch=('i686' 'x86_64')
url="http://wiki.github.com/amolenaar/gaphas"
license=('LGPL')
depends=('pygtk' 'python2-decorator' 'python-simplegeneric')
makedepends=('python2-nose' 'python2-distribute')
conflicts=('gaphas')
replaces=('gaphas')
provides=('gaphas' 'gaphas-git')
source=()
install=""
md5sums=()

_gitroot="git://github.com/amolenaar/gaphas.git"
_gitname="gaphas"

build() {
    msg "Connecting to github.com GIT server...."

    if [ -d ${srcdir}/$_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build

    cd ${srcdir}/$_gitname-build

    python2 setup.py build
}

package() {
    cd ${srcdir}/$_gitname-build
    
    python2 setup.py install --root="${pkgdir}/" 
}


