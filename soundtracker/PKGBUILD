# Contributor: Johannes Schriewer <jschriewer@arcor.de>

pkgname=soundtracker
pkgver=0.6.8
pkgrel=1
pkgdesc="A pattern-oriented music tracker similar to FastTracker2 with support for jackd, oss and esd."
url="http://www.soundtracker.org"
depends=('gtk' 'jack-audio-connection-kit' 'gdk-pixbuf' ) 
source=(http://www.soundtracker.org/dl/v0.6/$pkgname-$pkgver.tar.gz) 
md5sums=('1e5a2ef689e214933e53f687b3a199bb')       

build() { 
   cd $startdir/src/$pkgname-$pkgver 
   ./configure --prefix=/usr
   make || return 1 
   make prefix=$startdir/pkg/usr install 
} 
