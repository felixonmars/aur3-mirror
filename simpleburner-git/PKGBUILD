# Maintainer: Marcin Karpezo <sirmacik at gmail dot com>

pkgname=simpleburner-git
pkgver=20100112
pkgrel=1
pkgdesc="To symplify Your CD/DVD's burning under the CLI"
arch=(any)
url="http://sirmacik.net/simpleburner/"
license=('BSD')
depends=('perl' 'cdrkit')
makedepends=('git')
source=()
md5sums=()

_gitname="simpleburner"
_gitroot="  git://repo.or.cz/${_gitname}.git"

build() {
    cd ${startdir}/src
    
    if [[ -d ${startdir}/src/${_gitname} ]]; then
        cd ${_gitname}
        git pull origin || return 1
    else
        git clone ${_gitroot} || return 1
    fi
    
    mkdir -p ${startdir}/pkg/usr/bin
    install -Dm 755 ${startdir}/src/${_gitname}/${_gitname}.pl ${startdir}/pkg/usr/bin/${_gitname}
}
