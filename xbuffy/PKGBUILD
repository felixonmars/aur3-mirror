#Contributor Scott Robbins <scottro@nyc.rr.com> 
pkgname=xbuffy 
pkgver=3.3.bl.3 
pkgrel=1 
pkgdesc="xbuffy is an Xbiff type program that can watch multiple
mailboxes"  
url="http://www.fiction.net/blong/programs/xbuffy/"
 
depends=(x-server) 
source=(http://www.fiction.net/blong/programs/xbuffy/$pkgname-$pkgver.tar.gz) 
md5sums=(f4de2adc9d0b2327040e700e2fd25a42) 

build() { 
  cd $startdir/src/$pkgname-$pkgver 
  ./configure --prefix=/usr 
  make || return 1 
  make prefix=$startdir/pkg/usr install 
}
