# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Matt McDonald <metzen@gmail.com>
# Contributor: Stefan Wilkens <stefanwilkens@gmail.com>

pkgname=gpar2
pkgver=0.3
pkgrel=5
pkgdesc="A gtkmm client for verifying and repairing PAR archives"
arch=('i686' 'x86_64')
url="http://parchive.sourceforge.net/"
license=('GPL')
depends=('libpar2' 'gtkmm' 'desktop-file-utils')
install=gpar2.install
makedepends=('pkgconfig>=0.9')
source=(http://downloads.sourceforge.net/parchive/$pkgname-$pkgver.tar.gz 'gpar2-0.3.diff')
md5sums=('dcfaecd8cbc005fb8e38c0bf5ba8ca04'
         'a37f3f2e795e01dbfdb5ff9279c7d4ed')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../$pkgname-$pkgver.diff
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
