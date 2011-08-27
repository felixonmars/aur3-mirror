# Contributor: shamrok <szamrok@gmail.com>
 
pkgname=kwmnet
pkgver=0.2
pkgrel=1
pkgdesc="KDE Fork of famous wmnet WindowMaker applet" 
url="http://kde-apps.org/content/show.php/kwmnet?content=57217" 
depends=('kdelibs')
source=(http://nmt.btv.ru/kwmnet/$pkgname-$pkgver.tar.gz) 
md5sums=('4baa6aa65364b8891a48ec6aea2987c7') 
arch=('i686')
license="GPL" 

build() { 
     cd $startdir/src/$pkgname-$pkgver
     ./configure --prefix=/opt/kde
     make || return 1 
     make DESTDIR=$startdir/pkg install 
}  
