# Contributor: sickhate <sickhate@tux-linux.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=simdock
pkgver=1.2
pkgrel=5
pkgdesc="Fast and customizable dockbar."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/simdock/"
license=('GPL')
depends=('wxgtk2.8' 'libwnck' 'gconf' 'desktop-file-utils')
provides=('simdock')
conflicts=('simdock')
install=simdock.install
source=("http://sourceforge.net/projects/simdock/files/simdock/1.2/simdock_1.2.tar.gz")
md5sums=('557f4aff394fa66e329c56c3a5138b39')

prepare() {
  cd "$srcdir/"
  rm -r "${pkgname}_${pkgver}"
  mv trunk "${pkgname}_${pkgver}"
}

build() {
  cd "$srcdir/${pkgname}_${pkgver}"
  ./configure LDFLAGS=-lX11 --with-wx-config=/usr/bin/wx-config-2.8 --prefix=/usr
  make 
}

package() {
  cd "$srcdir/${pkgname}_${pkgver}"
  make DESTDIR="$pkgdir" install
  rm -rf $pkgdir/usr/local
}
