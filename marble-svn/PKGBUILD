# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=marble-svn
pkgver=1161900
pkgrel=1
pkgdesc="Virtual Globe and World Atlas(qt4 version)"
arch=('i686' 'x86_64')
url="http://edu.kde.org/marble"
license=('LGPL 2.1')
depends=('openssl' 'qt')
### uncomment next line if you want gps support
#depends=('gpsd' 'openssl' 'qt')
makedepends=('cmake' 'subversion')
conflicts=('marble')
 
_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdeedu/marble/
_svnmod=marble

build() {
   cd $startdir/src/

   svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

   msg "SVN checkout done or server timeout"
   msg "Starting make..."

   cd $srcdir/marble
   cmake -DCMAKE_INSTALL_PREFIX=/usr -DQTONLY=ON .
   make
   make DESTDIR=$pkgdir install
}
