# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="touchcal"
pkgver="0.50"
pkgrel="1"
pkgdesc="A touchscreen calibration utility"
arch=("i686" "x86_64")
url="http://touchcal.sourceforge.net/"
depends=("ncurses")
license=("GPL")
source=(http://downloads.sourceforge.net/sourceforge/touchcal/$pkgname-$pkgver.tar.gz)
md5sums=("59f3ca90387f5ad5364758db578c96cd")

build() {
 cd "$srcdir/$pkgname-$pkgver"
 ./configure --prefix=/usr
 make
}

package() {
 cd "$srcdir/$pkgname-$pkgver"
 make DESTDIR="$pkgdir" install
}
