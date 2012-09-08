pkgname=sonydb
pkgver=20120909
pkgrel=1
pkgdesc="a maintenance application for sony network players"
arch=('i686')
url="https://github.com/mattn/sonydb"
license=('BSD')
source=()
depends=('id3lib')
makedepends=('git')
optdepends=()
_gitroot="git://github.com/mattn/sonydb.git"
_gitname="sonydb"

build(){
    cd "${srcdir}"
    msg "Connecting to the Git server..."
    if [[ -d "${_gitname}" ]];then
        cd "${_gitname}"
        git pull origin
    else
        git clone "${_gitroot}" "${_gitname}"
        cd "${_gitname}"
    fi

    sh ./autogen.sh
    ./configure --prefix=/usr
    make || return 1
}

package(){
    cd "${srcdir}/${_gitname}"
    make DESTDIR="${pkgdir}" install || return 1
}
