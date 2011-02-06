# Contributor: buddabrod <buddabrod@gmail.org>

arch=('i686' 'x86_64')
pkgname=kthinkbat-svn
pkgver=227
pkgrel=1
pkgdesc="Laptop battery monitor for the KDE panel"
url="https://lepetitfou.dyndns.org/projects/kthinkbat"
license=('GPL')
depends=('kdelibs' 'kdebase')
makedepends=('subversion' 'autoconf' 'automake')
conflicts=('kthinkbat')
provides=('kthinkbat')

source=()
md5sums=()

_svntrunk=https://lepetitfou.dyndns.org/svn/kthinkbat/kthinkbat-kicker/trunk
_svnmod=kthinkbat-svn

build() {
   cd $startdir/src
  
   svn co $_svntrunk $_svnmod -r $pkgver
  
   msg "SVN checkout done or server timeout"
   msg "Starting make..."
      
   cp -r $_svnmod $_svnmod-build
   cd $_svnmod-build
   
   make -f Makefile.cvs
   
   [ -f /etc/profile.d/qt3.sh ] && source /etc/profile.d/qt3.sh
   ./configure 
   make || return 1
   make DESTDIR=${startdir}/pkg install
       
   rm -rf $startdir/src/$_svnmod-build
}
