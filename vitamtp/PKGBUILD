# Maintainer: trya <tryagainprod@gmail.com>

pkgname=vitamtp
pkgver=2.0.0
pkgrel=1
pkgdesc="A library for low level USB communications with the PS Vita (includes the opencma utility)"
arch=('i686' 'x86_64')
url="http://yifan.lu/p/vitamtp"
license=('GPL')
depends=('libxml2' 'libusbx')
options=(!libtool)
source=("https://sites.google.com/a/yifanlu.com/downloads/vitamtp-$pkgver.tar.gz"
        vitamtp1.udev)
md5sums=('7e119a36e71474033edeeadf18ad1a14'
         'a7562c7c1cc46c20c5c1f3a9978d39d0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr CFLAGS="$(pkg-config --cflags libxml-2.0 libusb-1.0)"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/vitamtp1.udev" "$pkgdir/usr/lib/udev/rules.d/80-psvita.rules"
}
