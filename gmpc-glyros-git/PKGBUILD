# Maintainer: Christopher Pahl <sahib@online.de>
# glyr PKGBUILD for glyr 
pkgname=gmpc-glyros-git
pkgver=20110901
pkgrel=1
pkgdesc="libglyr Metadata-Plugin for GMPC"
arch=('i686' 'x86_64')
depends=(glyr gtk2)
conflicts=('gmpc-glyros')
makedepends=('git' 'cmake')
license=('GPL3')
url=("https://github.com/sahib/gmpc-glyros")

_gitroot="git://github.com/sahib/gmpc-glyros.git"
_gitname="gmpc-glyros"

build() 
{
    cd ${srcdir}/

    msg "Connecting to the Git server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
        cd ${_gitname}
        git pull origin master
	msg "Updating existing repo..."
    else
        git clone ${_gitroot}
    fi
    
    msg "Git checkout done."
    cd ${srcdir}/${_gitname}
    echo $(pwd)  
 
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make || return 1
}

package() {
  cd "$srcdir/${_gitname}"
  make DESTDIR=$pkgdir install || return 1
}
