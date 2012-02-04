# Contributor : Geraud Le Falher <daureg@gmail.com>

pkgname=log4cpp-old
pkgver=0.3.5rc3
pkgrel=1
pkgdesc="A library of C++ classes for flexible logging to files, old version for freeorion."
url="http://log4cpp.hora-obscura.de/"
arch=('i686' 'x86_64')
license=('LGPL')
depends=()
options=('!libtool')
source=(http://downloads.sourceforge.net/log4cpp/log4cpp-$pkgver.tar.gz 
        log4cpp-old.patch)
    
md5sums=('13177d6bf50e403cc72b15e903326392'
         'f432e90a8139137de8661f69dc164d15') 

build() {

  #Build and install the package
  cd $srcdir/log4cpp-$pkgver
  patch -Np0 -i $srcdir/log4cpp-old.patch || return 1
  ./configure --prefix=/usr --disable-doxygen --disable-dot --without-idsa || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  
}

# vim:set ts=2 sw=2 et:
