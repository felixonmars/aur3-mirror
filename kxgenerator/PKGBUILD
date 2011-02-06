# Contributor: shamrok <szamrok@gmail.com>
 
pkgname=kxgenerator
pkgver=0.3.7
pkgrel=2
pkgdesc="Graphical utility to configure the X server." 
url="http://kde-apps.org/content/show.php?content=39085" 
depends=('kdelibs') 
source=(http://dp0154.debowypark.waw.pl/$pkgname-$pkgver.tar.bz2) 
md5sums=('dd539d7983597f050bf6bc67c790a939') 
arch=(i686)
license="GPL"

build() { 
     cd $startdir/src/$pkgname-$pkgver 
     ./configure --prefix=/opt/kde 
     make || return 1 
     make DESTDIR=$startdir/pkg install 
}  
