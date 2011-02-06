# Maintainer: Sebastien Duquette <ekse.0x@gmail.com>
pkgname=blitzen
pkgver=0.0.8r1
pkgrel=1
pkgdesc="An application server written in C/GObject able to run compiled applications written in Vala or directly in plain-C/GObject "
arch=('i686' 'x86_64')
url="http://www.blitzen.org/"
license=('GPL')
depends=('glib2' 'vala')
makedepends=('pkg-config')
backup=('etc/blitzen/blitzen.conf')
source=("http://downloads.sourceforge.net/project/blitzen/$pkgname-0.0.8-r1.tar.gz")
md5sums=('a40411bc5546813d863b687114152d1e')

build() {
  cd "$srcdir/$pkgname-0.0.8-r1"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
  
}

# vim:set ts=2 sw=2 et:
