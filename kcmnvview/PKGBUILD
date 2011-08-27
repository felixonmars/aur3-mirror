# Contributor: MeMi69 <MetalMilitia@gmx.net>
 
pkgname=kcmnvview
pkgver=0.3
pkgrel=1
pkgdesc="a KDE kinfocenter modul for displaying additional nvidia graphic card settings" 
url="http://kde-apps.org/content/show.php/kcmnvview?content=59107" 
depends=('kdelibs') 
source=(http://kcmnvview.hjcms.de/Download/0.3/$pkgname-$pkgver.tar.bz2) 
md5sums=('4c37a75cbdb5f40752f317299c831e90') 
arch=(i686)
license="GPL" 

build() { 
     cd $startdir/src/$pkgname-$pkgver 
     ./configure --prefix=/opt/kde 
     make || return 1 
     make DESTDIR=$startdir/pkg install 
}