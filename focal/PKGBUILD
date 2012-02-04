#Contributor: karnath <karnathtorjian@gmail.com>

pkgname=focal
pkgver=1.0.4
pkgrel=1
pkgdesc="colorado zephyrs dialect of FOCAL-69 programming language"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://cozx.com/"
source=("ftp://www.cozx.com/pub/langs/focal-${pkgver}.tar.gz")
md5sums=('c474acffe208f83a062b6c009a333861')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make INSTDIR=$pkgdir/usr install
}

