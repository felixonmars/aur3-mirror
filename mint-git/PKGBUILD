# Maintainer: Spencer Judd <spencercjudd@gmail.com>

pkgname=mint-git
pkgver=20120604
pkgrel=1
pkgdesc="Small python script to check the balance of mint.com accounts"
arch=("any")
url="https://github.com/scjudd/mint"
license=("GPL")
depends=("python2" "python2-lxml")
makedepends=("git")
provides=("mint")

_gitroot="git://github.com/scjudd/mint.git"
_gitname="mint"

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
