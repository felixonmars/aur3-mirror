#Maintainer: karnath <karnathtorjian@gmail.com>

pkgname=cupscapt
pkgver=0.1.1
pkgrel=1
pkgdesc="Open Canon CAPT Printer Driver for Linux"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libcups' 'libusb' 'cups')
url="http://sourceforge.net/projects/foo2capt/"
source=("http://downloads.sourceforge.net/project/foo2capt/$pkgname-$pkgver.tar.gz")
md5sums=('0c8e44d7d950bb16394fb69c6f99180f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir  install

}

