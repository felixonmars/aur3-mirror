# Maintainer: Adria Arrufat (swiftscythe) <swiftscythe@gmail.com>

pkgname=libmediaart
pkgver=0.3.0
_tver=${pkgver%.*}
pkgrel=1
pkgdesc="Library for handling media art"
arch=(i686 x86_64)
license=(GPL)
depends=(gdk-pixbuf2)
url="http://www.gnome.org"
options=('!emptydirs')
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/$_tver/$pkgname-$pkgver.tar.xz)
sha256sums=('d9c16e040d1ee7ef0b6d2387419cc74b462ffbfd1325975f1951dcbf7632f77e')

build() {
  cd $pkgbase-$pkgver

  ./configure --prefix=/usr

  make
}

package() {

  cd $pkgbase-$pkgver
  make DESTDIR="$pkgdir" install

}
