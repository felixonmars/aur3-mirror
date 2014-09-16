pkgname="php-igbinary"
pkgver=1.2.1
pkgrel=1
pkgdesc="Efficient replacement for the standard PHP serializer"
arch=('i686' 'x86_64')
url="https://github.com/igbinary/igbinary/"
license=('BSD')
depends=('php')
backup=('etc/php/conf.d/igbinary.ini')
source=("http://pecl.php.net/get/igbinary-1.2.1.tgz" "igbinary.ini")
md5sums=('04a2474ff5eb99c7d0007bf9f4e8a6ec'
         '712d2158a379bf7bd7bcc37889e0cc85')
build() {
    cd $srcdir/igbinary-$pkgver
    phpize
    ./configure --prefix=/usr --enable-igbinary
    make
}

package() {
        cd $srcdir/igbinary-$pkgver
	make INSTALL_ROOT=$pkgdir install
	install -D -m644 $srcdir/igbinary.ini $pkgdir/etc/php/conf.d/igbinary.ini
        install -vDm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
