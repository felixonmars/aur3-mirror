pkgname=zmm
pkgver=1.2.0
pkgdesc="A Zephir & Zephir Modules Manager"
pkgrel=1
arch=any
url="https://github.com/wapmorgan/zmm"
source=("https://github.com/wapmorgan/$pkgname/archive/$pkgver.tar.gz")
md5sums=('1c0d7dab65b2141a49dbfe5545555b84')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D zmm.py $pkgdir/usr/bin/zmm	
}
