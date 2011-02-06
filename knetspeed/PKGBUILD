#Contributor: failure <ljofre@gmail.com> 

pkgname=knetspeed 
pkgver=0.2 
pkgrel=1 
pkgdesc="KNetSpeed is a Kicker(KDE panel) applet to show a ethernet device speed." 
url="http://ktown.kde.cl/~elkrammer/knetspeed/" 
depends=('kdelibs') 
source=(http://mirror.kde.cl/knetspeed/$pkgname-$pkgver.tar.bz2) 
md5sums=(0ce4cce76cdcaac36207db626cbdd7fc) 
build() 
{ 
cd $startdir/src/$pkgname-$pkgver 
 
./configure --prefix=$KDEDIR 
make || return 1 
make DESTDIR=$startdir/pkg install 

}
