# Contributor: shamrok <szamrok@gmail.com>
 
pkgname=kommando
pkgver=0.5.2
pkgrel=1
pkgdesc="Kommando is a 'Neverwinter Nights' like wheelmenu for KDE" 
arch=('i686')
url="http://kde-apps.org/content/show.php?content=29514" 
license=('GPL')
depends=('kdelibs') 
source=(http://kde-apps.org/CONTENT/content-files/29514-$pkgname-$pkgver.tar.bz2) 
md5sums=('681c1199bb1e69b99a2a4b1c693df52c') 

build() { 
     cd $startdir/src/$pkgname-$pkgver 
     ./configure --prefix=/opt/kde 
     make || return 1 
     make DESTDIR=$startdir/pkg install 
}  
