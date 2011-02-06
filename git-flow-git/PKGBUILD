# Maintainer: Neil Santos <nsantos16+aur@gmail.com>

pkgname=git-flow-git
pkgver=20100826
pkgrel=1
pkgdesc='Custom git branching model'
arch=('i686' 'x86_64')
url='http://nvie.com/git-model'
license=('BSD')
depends=('git')
source=()

_gitroot="git://github.com/nvie/gitflow.git"
_gitname="git"

build() {
    if [ -d ${srcdir}/${_gitname} ]
    then
        msg "Updateing local repository..."
        cd ${_gitname}
        git pull origin master || return 1
        msg "The local files are updated."
    else
        git clone ${_gitroot} ${_gitname}
    fi
    msg "git checkout done or server timeout"

    cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
    cd ${srcdir}/${_gitname}-build

    msg "Fetching git submodules"
    git submodule init
    git submodule update

    msg "Starting make..." 
    make prefix=$pkgdir/usr install || return 1
}
