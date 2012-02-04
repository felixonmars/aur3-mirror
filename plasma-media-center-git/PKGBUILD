# Contributor: Flamelab <panosfilip@gmail.com>

pkgname=plasma-media-center-git
pkgver=20100503
pkgrel=1
pkgdesc="A Media Center for the KDE Software Compilation based on plasma technology"
arch=("i686" "x86_64")
url="http://gitorious.org/plasma-media-center"
license=('GPL3')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' )

_gitroot="git://gitorious.org/~olingerc/plasma-media-center/pmc-mainline.git"
_gitname="plasma-media-center"


build() {
  cd ${srcdir}/

    msg "Connecting to the Gitorious GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
    	cd ${_gitname}
    	git pull origin
    	msg "The local files are updated..."
    else
    	git clone ${_gitroot} ${_gitname}
    fi
    
    msg "GIT checkout done."

    msg "Starting make for: ${pkgname}"
    
    if [[ -d ${srcdir}/${_gitname}-build ]]; then
       msg "Cleaning the previous build directory..." 
       rm -rf ${srcdir}/${_gitname}-build
    fi

    git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
    
    cd ${srcdir}/${_gitname}-build

    cmake -DCMAKE_INSTALL_PREFIX=$( kde4-config --prefix ) -DCMAKE_BUILD_TYPE=Release .

    make || return 1
    make DESTDIR=$pkgdir install || return 1

}
