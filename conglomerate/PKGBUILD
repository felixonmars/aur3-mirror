# Contributor: Dejan Čabrilo <dcabrilo at bitspan dot rs>
# Maintainer: Axper Jan <483ken at gmail dot com>
pkgname=conglomerate
pkgver=0.9.1
pkgrel=4
pkgdesc="A free user-friendly XML editor, for DocBook and other document types."
arch=('i686' 'x86_64')
url="http://www.conglomerate.org/"
license=('GPL')
depends=('desktop-file-utils' 'libgnomeui' 'libxslt')
makedepends=('intltool' 'perlxml' 'rarian')
install="conglomerate.install"
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('49ad67492e947d6c15e5b875d8360890')

build() {
  cd $srcdir/$pkgname-$pkgver
  msg "Configuring..."
  ./configure --prefix=/usr --sysconfdir=/etc --enable-printing --localstatedir=/var/lib
  msg "Making..."
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  msg "Make installing..."
  make DESTDIR=$pkgdir install
  msg "Creating package directories..."
  mkdir -p $pkgdir/usr/share/gconf/schemas
  msg "gconf-merge-schema..."
  gconf-merge-schema $pkgdir/usr/share/gconf/schemas/$pkgname.schemas $pkgdir/etc/gconf/schemas/*.schemas || return 1
  msg "Removing schemas..."
  rm -f $pkgdir/etc/gconf/schemas/*.schemas
  msg "cd to pkgdir..."
  cd $pkgdir
  msg "removing etc/gconf/schemas..."
  rmdir -p etc/gconf/schemas
}
