# Contributor: FAWN <add at email dot cz>
# Maintainer: FAWN <add at email dot cz>
pkgname=kdemod3-khdapsmonitor
pkgver=0.1
pkgrel=1
pkgdesc="KDE Monitor for the Hard Drive Active Protection System patched for running in Kdemod3-Trinity" 
arch=('i686' 'x86_64')
url="http://roy.marples.name/node/269"
license=('GPL') 
depends=('kdelibs3') 
source=(http://roy.marples.name/downloads/khdaps/khdapsmonitor-${pkgver}.tar.bz2
	new_interface.patch
	about_window.patch)

md5sums=('6d6d53ebf3979cac09677233d0e1fcb6'
         '93a588a4b84226a8b56f61a8b193930a'
	 'b6cfb16c36e6c2a354d74a26cec706cb')
 
build() { 
  patch -Np0 -i $srcdir/new_interface.patch
  patch -Np0 -i $srcdir/about_window.patch
	
  [ "$QTDIR" = "" ] && source /etc/profile.d/qt3.sh
  [ "$KDEDIR" = "" ] && source /etc/profile.d/kde3.sh

  cd $srcdir/khdapsmonitor-$pkgver
  ./configure --prefix=/opt/kde3 --enable-final 
  make || return 1 
  make DESTDIR=$pkgdir install || return 1
}
