# Contributor: buddabrod <buddabrod@gmail.com>
 
pkgname=khdapsmonitor
pkgver=0.1
pkgrel=3
pkgdesc="KDE Monitor for the Hard Drive Active Protection System" 
arch=('i686' 'x86_64')
url="http://roy.marples.name/node/269"
license=('GPL') 
depends=('kdelibs3') 
source=(http://roy.marples.name/downloads/khdaps/${pkgname}-${pkgver}.tar.bz2
	new_interface.patch)
md5sums=('6d6d53ebf3979cac09677233d0e1fcb6'
         '93a588a4b84226a8b56f61a8b193930a')
 
build() { 
  patch -Np0 -i $srcdir/new_interface.patch
	
  [ "$QTDIR" = "" ] && source /etc/profile.d/qt3.sh
  [ "$KDEDIR" = "" ] && source /etc/profile.d/kde3.sh

  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/opt/kde --enable-final 
  make || return 1 
  make DESTDIR=$pkgdir install || return 1

}  
                         
