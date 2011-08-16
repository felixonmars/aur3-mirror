# Contributor: Ilya Petrov <ilya.muromec@gmail.com>

pkgname="librbus-git"
pkgver=0.1
pkgrel=3
pkgdesc="The lastest Realdesktop Bus library"
url="http://rbus.enodev.org"
license="BSD"
arch=("i686" "x86_64" "arm" "armv7h")
makedepends=("git")
provides=("librbus")
source=()
md5sums=()

__gitroot="https://github.com/realdesktop/"
__gitname="filebus"

__flags=( \
        "PREFIX=/usr" \
        "ETC=/etc" \
        "PREFIX=${pkgdir}/usr" \
)

build() {

    cd $srcdir

    ## Git checkout
    if [ -d $srcdir/${__gitname} ] ; then
      msg "Git checkout:  Updating existing tree"
      cd ${__gitname} && git checkout ${_commit}
      msg "Git checkout:  Tree has been updated"
    else
      msg "Git checkout:  Retrieving sources"
      git clone ${__gitroot}/${__gitname} ${__gitname}  && cd ${__gitname} && git checkout ${_commit} 
    fi
    msg "Checkout completed"

    ## Build
    [ -d ${__gitname}-build ] || rm -rf $srcdir/${__gitname}-build
    git clone $srcdir/${__gitname} $srcdir/${__gitname}-build
    cd $srcdir/${__gitname}-build
    
    msg "Starting build process."
    make ${__flags[@]}
}

package() {
    cd $srcdir/${__gitname}-build
    make ${__flags[@]} install
}

# vim: set noet ff=unix
