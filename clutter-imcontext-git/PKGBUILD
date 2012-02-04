# Previous Contributor: atie H. <atie.at.matrix@gmail.com>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=clutter-imcontext-git
pkgver=20100212
pkgrel=1
pkgdesc="Library dependent on clutter."
arch=('i686' 'x86_64')
url="http://www.moblin.org/"
license=('LGPL')
depends=('clutter' 'cairo')
options=('!libtool')
provides=('clutter-imcontext')
conflicts=('clutter-imcontext')

_gitroot="git://git.moblin.org/clutter-imcontext"
_gitname="clutter-imcontext"

build() {
 cd ${srcdir}/

    msg "Connecting to the Freedesktop.org GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
    	cd ${_gitname}
    	git pull origin
    	msg "The local files are updated..."
    else
    	git clone ${_gitroot}
    fi
    
    msg "GIT checkout done."

    msg "Starting make for: ${pkgname}"
    
    if [[ -d ${srcdir}/${_gitname}-build ]]; then
       msg "Cleaning the previous build directory..." 
       rm -rf ${srcdir}/${_gitname}-build
    fi

    git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
    
    cd ${srcdir}/${_gitname}-build
        

  msg "Starting build"
  ./autogen.sh --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
