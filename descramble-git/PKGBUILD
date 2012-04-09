# Maintainer: Spencer Judd <spencercjudd@gmail.com>

pkgname=descramble-git
pkgver=20120409
pkgrel=1
pkgdesc="Solve Scramble with Friends puzzles like a pro."
arch=('any')
url="https://github.com/scjudd/descramble"
license=('GPL')
depends=('python2' 'wxpython')
makedepends=('git')
provides=('descramble')

_gitroot="git://github.com/scjudd/descramble.git"
_gitname="descramble"

build() {
    cd ${srcdir}
    msg "Connecting to GIT server...."

    if [ -d ${_gitname} ]; then
        cd ${_gitname} && git pull origin
        msg "The local files are updated."
    else
        git clone ${_gitroot}
    fi

    msg "GIT checkout done or server timeout."
}

package() {
    cd ${srcdir}/${_gitname}
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}
