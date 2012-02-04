# Contributor: Igor V Belov <i.v.belov at gmail.com>

pkgname=simpledict
pkgver=0.3.0
pkgrel=1
pkgdesc="SimpleDict is a free, opensource electronic dictionary which provides easy-to-use modern user interface and supports several dictionary formats."
arch=('i686' 'x86_64')
url='http://simpledict.sourceforge.net/'
license=('GPL')
depends=('qt>=4.3')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver-src.tar.gz")
md5sums=('29da583e94e9a537d1a64ea3ce455559')

build() {
	cd $srcdir/simpledict-0.3.0-src
        qmake || return 1
	make || return 1
	make INSTALL_ROOT="$pkgdir" install
}
