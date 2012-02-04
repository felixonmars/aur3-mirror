pkgname=zend-optimizer-old
pkgver=3.3.9
pkgrel=2
pkgdesc="An old version of Zend Optimizer capable of running php-5.2 scripts."
arch=('i686' 'x86_64')
url="http://www.zend.com/en/products/optimizer"
license=('custom')
depends=('php52')
makedepends=('php52')
install=('zend-optimizer-old.install')

if  [ $CARCH = "x86_64" ]
	then
		_arch="x86_64"
		md5sums=('dd4a95e66f0bda61d0006195b2f42efa'
		         '07550efb0b8253e030a522a7f94fe30b')
	else
		_arch="i386"
		md5sums=('150586c3af37fbdfa504cf142c447e57'
         		'07550efb0b8253e030a522a7f94fe30b')
fi

source=(http://downloads.zend.com/optimizer/$pkgver/ZendOptimizer-3.3.9-linux-glibc23-$_arch.tar.gz
		zend-optimizer-old.install)

build() {
    mkdir -p $pkgdir/usr/lib/php/modules/
    install -D -m644 $srcdir/ZendOptimizer-$pkgver-linux-glibc23-$_arch/data/5_2_x_comp/ZendOptimizer.so $pkgdir/usr/lib/php/modules/ || return 1
}
