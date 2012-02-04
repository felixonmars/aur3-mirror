# Contributor: Andreas Schönfelder <passtschu@freenet.de>
 
pkgname=tastymenu
pkgver=1.0.8
pkgrel=1
pkgdesc="Tasty Menu is a KMenu replacement aiming to provide the maximum usability." 
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=41866" 
license=('LGPL')
depends=('kdelibs3') 
source=(http://www.notmart.org/files/$pkgname-$pkgver.tar.bz2) 
md5sums=('35be4b3e94850e32d83019809f569734')

build() { 
     source /etc/profile.d/qt3.sh
     cd $startdir/src/$pkgname-$pkgver 
     ./configure --prefix=/opt/kde 
     make || return 1 
     make DESTDIR=$startdir/pkg install 
}  
