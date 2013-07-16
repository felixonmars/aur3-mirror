# Maintainer: palkeo <contact @ palkeo _dot_ com>

pkgname=python2-threescale-api
pkgver=20110712
pkgrel=1
pkgdesc="A python API for threescale"
arch=(any)
url="https://github.com/3scale/3scale_ws_api_for_python"
license=('MIT')
depends=('python2')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/3scale/3scale_ws_api_for_python.git"
_gitname="3scale_ws_api_for_python"

build() {
    if [[ -d $_gitname ]] ; then
        git-pull origin || return 1 
    else
        git clone $_gitroot || return 1
    fi
    cd $_gitname

    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir --optimize=1 || return 1
}
