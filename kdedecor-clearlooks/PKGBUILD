# Contributor: shamrok <szamrok@gmail.com>
 
pkgname=kdedecor-clearlooks
pkgver=0.1
pkgrel=1
pkgdesc="Kde window decoration based on gtk clearlooks" 
url="http://www.kde-look.org/content/show.php?content=52772" 
depends=('kdelibs') 
source=(http://ferencnf.googlepages.com/clearlooks_kde-$pkgver.tar.bz2) 
md5sums=('4d745aedb58bcebe3f396ae50da64c40') 
arch=('i686' 'x86_64')
license="GPL" 

build() { 
     cd $startdir/src/clearlooks_kde-$pkgver
     ./configure --prefix=/opt/kde 
     make || return 1 
     make DESTDIR=$startdir/pkg install 
}  
