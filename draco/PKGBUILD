# Contributor: Minh Nguyen <manehi at gmail dot com>
pkgname=draco
pkgver=1.4
pkgrel=1
pkgdesc="Java-based econometrics software from approximatrix"
url="http://approximatrix.com/products/draco/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('java-runtime' 'bash')
source=("http://download.approximatrix.com/draco/$pkgname-R$pkgver.zip" "draco.sh")
md5sums=('33abb91a7d4814c9ee6b9ad3b9adca1e' '3c626ec11b89ab5652bf06df907929d0')

build() {
#	copy .jar files
	mkdir -p $pkgdir/usr/share/java/draco || return 1;
	cp -r $srcdir/$pkgname-R$pkgver/lib/* $pkgdir/usr/share/java/draco || return 1;
	ln -s $pkgname-$pkgver.jar $pkgdir/usr/share/java/draco/$pkgname.jar || return 1;

#	ignore docs and example files
#	cp -r $srcdir/$pkgname-R$pkgver/doc $pkgdir/usr/share/java/draco || return 1;
#	cp -r $srcdir/$pkgname-R$pkgver/examples $pkgdir/usr/share/java/draco || return 1;

#	install the launcher script
	install -D -m 755 draco.sh $pkgdir/usr/bin/draco || return 1;

}

