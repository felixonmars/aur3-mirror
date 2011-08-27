# Maintainer: Eduardo Martins Lopes

pkgname=xdrfile
pkgver=1.1.1
pkgrel=1
pkgdesc="This library allows to read GROMACS trr and xtc files and also to convert from one format to another."
url="http://www.gromacs.org/"
license=("LGPL")
arch=('i686' 'x86_64')
depends=()
options=()
source=(ftp://ftp.gromacs.org/pub/contrib/xdrfile-$pkgver.tar.gz)
md5sums=('1ceb84765ec212a6f709faf559649023')

build() {
_dirver="${pkgver}" 
  mkdir -p ${startdir}/pkg/usr/bin  
  cd $startdir/src/${pkgname}-${_dirver}/
 
#  cd "$startdir/src/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make -j3 || return 1
  make DESTDIR="${startdir}/pkg" install || return 1
}
