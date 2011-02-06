# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=wbox
pkgver=5
pkgrel=2
pkgdesc="HTTP testing tool that includes benchmarking and other tests"
source=("http://hping.org/wbox/$pkgname-$pkgver.tar.gz")
url="http://hping.org/wbox/"
license='BSD'
arch=('i686' 'x86_64')
md5sums=('a95ca2c69982db10704b5ed482c9c722')
		 
build() {

	cd $srcdir/$pkgname-$pkgver
 
	

	make
  }

package() {

	cd $srcdir/$pkgname-$pkgver
  
	install -Dm755 wbox $pkgdir/usr/bin/wbox
	
	install -d $pkgdir/usr/share/licenses/$pkgname

	install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
   
}

