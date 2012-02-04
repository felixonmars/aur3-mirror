# Contributor: Tomas Urgosik <tomas.urgosik@gmail.com>
 
pkgname=kdedecor-mytango
pkgver=0.1
pkgrel=1
pkgdesc="Kde window decoration" 
url="http://www.kde-look.org/content/show.php/MyTango?content=55251" 
depends=('kdelibs') 
source=(http://download.tuxfamily.org/nferko/kde/deco/mytango-$pkgver.tar.gz)
md5sums=('7752957c848a50fd0827746acce6b414') 
arch=(i686)
license="Creative Commons Attribution Share-Alike license" 

build() { 
     cd $startdir/src/mytango-$pkgver
     ./configure --prefix=/opt/kde 
     make || return 1 
     make DESTDIR=$startdir/pkg install 
}  
