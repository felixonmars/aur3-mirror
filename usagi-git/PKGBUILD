pkgname=usagi-git
pkgver=20120825
pkgrel=1
pkgdesc="A set of zsh utility functions."
arch=('i686' 'x86_64')
url="http://github.com/nuisanceofcats/usagi"
license=('MPL' 'GPL' 'LGPL')
depends=('zsh')
makedepends=('make')
provides=(usagi)
_gitroot="git://github.com/nuisanceofcats/usagi.git"
_gitname="usagi"

build() {
    cd $srcdir

    ## Git checkout
    if [ -d $srcdir/${_gitname} ] ; then
        msg "Git checkout:  Updating existing tree"
        cd ${_gitname} && git pull origin  || return 1
        msg "Git checkout:  Tree has been updated"
    else
        msg "Git checkout:  Retrieving sources"
        git clone ${_gitroot}  || return 1
    fi
    msg "Checkout completed"
}

package() {
    cd $srcdir/${_gitname}
    make install DESTDIR=$pkgdir
}
