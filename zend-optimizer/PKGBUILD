pkgname=zend-optimizer
pkgver=5.5.0
pkgrel=1
pkgdesc="Zend Guard and Zend Optimizer are the industry leading solution for PHP IP protection."
arch=('x86_64')
url="http://www.zend.com/en/products/guard"
license=('custom')
depends=('php>=5.3')
makedepends=('php')
source=(zend_optimizer.ini http://downloads.zend.com/guard/$pkgver/ZendGuardLoader-php-5.3-linux-glibc23-x86_64.tar.gz)
md5sums=('1bb130d00c4bd4f7569ccb5d34752504' '9408297e9e38d5ce2cca92c619b5ad50')

build() {
    mkdir -p $pkgdir/usr/lib/php/modules/
    install -D -m644 $srcdir/ZendGuardLoader-php-5.3-linux-glibc23-x86_64/php-5.3.x/ZendGuardLoader.so $pkgdir/usr/lib/php/modules/ || return 1
    mkdir -p $pkgdir/etc/php/conf.d/
    install -D -m644 $srcdir/zend_optimizer.ini $pkgdir/etc/php/conf.d/
}
