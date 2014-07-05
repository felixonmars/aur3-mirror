# Author: Alen Skondro <askondro@gmail.com>

pkgname=guix-git
pkgver=20140704
pkgrel=1
pkgdesc="GNU guix is a purely functional package manager"
arch=('x86_64' 'i686')
url="https://www.gnu.org/software/guix/"
license=('GPL')
depends=('guile>=2.0' 'sqlite' 'bzip2' 'libgcrypt' 'graphviz')
makedepends=('git')

_gitroot='git://git.savannah.gnu.org/guix.git'
_gitname='guix'

build() {

    cd "${srcdir}"
    msg "Connecting to GIT server...."

    if [[ -d ${_gitname} ]]; then
	cd "${_gitname}" && git pull origin
	msg "The local files are updated."
    else
	git clone "${_gitroot}" "${_gitname}"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    cd "${srcdir}/${_gitname}"

    msg "Cleaning repository..."

    # make check creates test-tmp directory with read-only permissions
    # and cannot be removed by git 'clean -dxf' so we have to change the
    # permissions beforehand
    if [[ -d test-tmp ]]; then
    	chmod -Rf 777 test-tmp
    fi
    git clean -dxf

    ./bootstrap
    ./configure --prefix=/usr 
    make V=1
}

check() {
    cd "${srcdir}/${_gitname}"
    #force only one build job, otherwise some test *will* fail
    make -k -j1 check  
}

package() {
    cd "${srcdir}/${_gitname}"
    make DESTDIR="${pkgdir}" install
}
