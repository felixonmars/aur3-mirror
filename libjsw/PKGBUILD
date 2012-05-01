pkgname=libjsw
pkgver=1.5.8
pkgrel=1
pkgdesc="joystick wrapper library (includes jscalibrator)"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk')
url="http://freecode.com/projects/libjsw"
source=(http://wolfsinger.com/~wolfpack/packages/$pkgname-$pkgver.tar.bz2)

build() {
	cd $srcdir/$pkgname-$pkgver/libjsw
	make CFLAGS="-fPIC $CFLAGS"

	cd $srcdir/$pkgname-$pkgver/jscalibrator
	sed -i 's|<jsw\.h>|"../include/jsw.h"|g' jc.h jc.c jcwidgets.c
	make LIB_DIRS=-L../libjsw
}

package() {
	cd $srcdir/$pkgname-$pkgver/libjsw
	make PREFIX=$pkgdir/usr install

	cd $srcdir/$pkgname-$pkgver/jscalibrator
	make PREFIX=$pkgdir/usr install
}

md5sums=('1158f770c3aa82587fd70e6bd3c840df')
