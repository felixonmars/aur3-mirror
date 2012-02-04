# Contributor: Daniel Nienhaus <daniel@golgafrincham.de>
pkgname=sprig
pkgver=1.0.0
pkgrel=2
pkgdesc="SDL Primitive Generator" 
arch=(i686)
url="http://pubpages.unh.edu/~jmb97/SPriG.html"
license=('LGPL')
depends=('sdl' 'gcc-libs')
makedepends=('unzip')
noextract=('Sprig%20Source%20v1.0.0.zip')
source=('http://pubpages.unh.edu/~jmb97/SDL/SPriG/Sprig%20Source%20v1.0.0.zip')
md5sums=('439aa0d5e0ba5148b75ebf36b48cc618')

build() {
  cd $startdir/src
  unzip Sprig%20Source%20v1.0.0.zip
  cd Sprig\ Source\ v1.0.0/
  sed -i "s|PREFIX =|PREFIX =$startdir/pkg|g" Makefile.conf 
  sed -i "s|PREFIX_H =|PREFIX_H =$startdir/pkg|g" Makefile.conf 
  make install || return 1
}
