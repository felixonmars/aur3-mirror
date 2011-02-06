# Contributor: shamrok <szamrok@gmail.com>
 
pkgname=konqburn
pkgver=1.0
pkgrel=3
pkgdesc="CD Writer sidebar for Konqueror" 
url="http://konqburn.sourceforge.net/" 
depends=('k3b') 
source=(http://dl.sourceforge.net/sourceforge/konqburn/$pkgname-$pkgver.tar.gz) 
md5sums=('2e286c19c6e181050b76e7eb746cea30') 
arch=(i686)
license="GPL"
 
build() { 
     cd $startdir/src/$pkgname-$pkgver 
     ./configure --prefix=/opt/kde 
     make || return 1 
     make DESTDIR=$startdir/pkg install 
}  
