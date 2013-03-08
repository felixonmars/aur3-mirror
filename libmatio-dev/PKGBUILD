# Maintainer: Marco Maso <demind@gmail.com>
pkgname=libmatio-dev
pkgver=1.3.4
pkgrel=1
pkgdesc="A C library with a fortran 90/95 module interface for reading/writing MATLAB MAT-files, version intended to be used with Scilab"
arch=('i686' 'x86_64')
url="http://www.mathworks.com/matlabcentral/fileexchange/loadFile.do?objectId=8187&objectType=File"
options=('!libtool')
conflicts=('libmatio')
provides=('libmatio')
license="LGPL"
depends=('zlib')
source=(http://dfn.dl.sourceforge.net/matio/matio-$pkgver.tar.gz)
md5sums=('a91208cf18f2456a5855bc1a9fdb90fd')

build() {
  cd $srcdir/matio-$pkgver
  ./configure --prefix=/usr --enable-fortran --enable-shared
  make -j2 || return 1
  make DESTDIR=$pkgdir install

}

