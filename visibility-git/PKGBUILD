# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=visibility-git 
pkgver=20080414 
pkgrel=1
pkgdesc='A pager best described as a cross between a pager and an iconbox' 
url=http://projects.l3ib.org/trac/visibility 
license=GPL 
arch=('i686' 'x86_64')
makedepends=(autoconf automake pkgconfig git) 
depends=(libpng libsigc++2.0 libxft) 
conflicts=visibility 
provides=visibility
replaces=visibility-svn
install=${pkgname}.install 
source=() 
md5sums=() 

_gitroot="git://code.l3ib.org/visibility.git" 
_gitname="visibility" 

build() { 
    cd $startdir/src 
    git clone $_gitroot 
    cd $_gitname 
    autoreconf 
    sed -i "/#include <vector>$/a #include <string>" src/ARGBData.h || return 1
    ./configure --prefix=/usr/ 
    make DESTDIR=${startdir}/pkg/ install || return 1
    install -d ${startdir}/pkg/usr/share/visibility/ 
    install -m644 *.sample ${startdir}/pkg/usr/share/visibility/ 
    cp -R scripts/ themes/ ${startdir}/pkg/usr/share/visibility/ 
}
