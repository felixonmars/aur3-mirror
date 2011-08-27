# Maintainer: malex984 at googlemail dot com

pkgname=msrp-git
pkgver=20101226
pkgrel=1
pkgdesc="Meta search and replace tool for both filenames and files: improved"
arch=('i686' 'x86_64')
url="http://msrp.github.com"
license=("Simplified BSD License")
groups=(editors)
depends=(pcre)
makedepends=('git' 'cmake')
conflicts=('msrp')
provides=('msrp')
replaces=(msrp)
backup=()
options=()
install=
noextract=()

_gitroot="git://github.com/malex984/msrp.git"
_gitname="msrp"
_gitbranch="master"

build() {
    cd ${srcdir}

    msg "Connecting to the git repository..."
    if [ -d ${srcdir}/${_gitname} ]; then
        cd ${_gitname}
        git pull origin
    else
        git clone --depth 1 -b ${_gitbranch} ${_gitroot} 
    fi
    msg "GIT checkout done or server timeout"

    rm -rf ${srcdir}/${_gitname}-build
    mkdir ${srcdir}/${_gitname}-build
#    cp -r  ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
    
    cd ${srcdir}/${_gitname}-build

    msg "Configuring... and generating makefiles..."
    cmake -D CMAKE_INSTALL_PREFIX=/usr/ -D CMAKE_BUILD_TYPE="Release" ${srcdir}/${_gitname} || return 1

    msg "Starting make..."
    make || return 1
    
#    msg "Starting tests..."
#    make check || return 1
    
    msg "Installing..."
    make DESTDIR="${pkgdir}/" install || return 1
    
    
    
}

