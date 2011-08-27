# Contributor: Dominik Fuchs <dominik.fuchs AT wur DOT nl>

pkgname=lidarformat
pkgver=53
pkgrel=1
pkgdesc="Library for efficiently handling 3D point clouds with a variable number of attributes at runtime"
arch=('i686' 'x86_64')
url="http://code.google.com/p/lidarformat/"
license=('LGPL')
depends=('boost' 'xerces-c-2' 'xsd')
makedepends=('cmake' 'mercurial')
source=()
noextract=()
md5sums=()
_hgroot=https://lidarformat.googlecode.com/hg/
_hgrepo=lidarformat

build() {
   cd ${startdir}/src

   msg "Connecting to mercurial repository..."
   if [ -d ${_hgrepo} ]; then
       cd ${startdir}/src/${_hgrepo}
       hg pull -u
   else
       hg clone ${_hgroot}${_hgrepo} || return 1
       cd ${startdir}/src/${_hgrepo}
   fi

   msg "Mercurial checkout done or server timeout"
   msg "Starting make..."
  
   cp -R ${startdir}/src/${_hgrepo} ${startdir}/src/${_hgrepo}-build
   cd ${startdir}/src/${_hgrepo}-build

   cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr . || return 1
   make || return 1
   make test || return 1
   make DESTDIR=${pkgdir} install || return 1

}

