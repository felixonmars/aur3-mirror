pkgname=pico
pkgver=2.00
pkgrel=1
pkgdesc='Pico text editor (the real one ;D)'
license=(apache)
depends=('gcc')
arch=('i686' 'x86_64')
url='http://www.washington.edu/alpine/'
source=(ftp://ftp.cac.washington.edu/alpine/alpine-$pkgver.tar.bz2)
md5sums='84e44cbf71ed674800a5d57eed9c1c52'
build(){
	cd $srcdir/alpine-$pkgver
        ./configure --prefix=/usr --without-ldap --without-ssl --without-krb5 --target slx  
	make
}
package(){
	 cd $srcdir/alpine-$pkgver
	 make DESTDIR="$pkgdir" install
         cd $pkgdir/usr/bin; rm pilot alpine rpdump rpload
}
