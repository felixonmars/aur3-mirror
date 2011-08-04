pkgname=passenger
pkgver=3.0.8
pkgrel=0
pkgdlnr=75219
pkgdesc="mod_rails passenger"
arch=('i686' 'x86_64')
url="http://www.modrails.com"
license=('GPL')
depends=('apache' 'ruby')
source=(http://rubyforge.org/frs/download.php/$pkgdlnr/$pkgname-$pkgver.tar.gz $pkgname.install $pkgname-install-apache2-module.patch)

md5sums=('b283f3be6bbbc93a94cc30f99ab0263e'
         'bf456565863345e2505b007cb228f48a'
         '3d04eba10c55a955c378678d5df8497f')

install=$pkgname.install

build(){
	patch $srcdir/$pkgname-$pkgver/bin/passenger-install-apache2-module $startdir/passenger-install-apache2-module.patch
	$srcdir/$pkgname-$pkgver/bin/passenger-install-apache2-module
	mkdir -p $pkgdir/etc/httpd/modules/
	cp $srcdir/$pkgname-$pkgver/ext/apache2/mod_passenger.so $pkgdir/etc/httpd/modules/mod_passenger.so
	mkdir -p $pkgdir/usr/lib/passenger/
	cp -R $srcdir/$pkgname-$pkgver/* $pkgdir/usr/lib/passenger/
}
