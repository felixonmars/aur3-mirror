# Maintainer: palkeo <palkeo on gmail>

pkgname=python2-sunburnt
pkgver=20110718
pkgrel=1
pkgdesc="A python API for solr"
arch=(any)
url="https://github.com/tow/sunburnt"
license=('WTFPL')
depends=('python2')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/tow/sunburnt.git"
_gitname="sunburnt"

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
 
