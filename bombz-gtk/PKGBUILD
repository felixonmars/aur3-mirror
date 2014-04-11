# Contributor: Jake LeMaster <ssoundasleep@gmail.com>
# Maintainer: cgar <carlos@cgarcia.org>

pkgname=bombz-gtk
pkgver=1.0
pkgrel=1
pkgdesc="A Minesweeper-like game using the GTK--(gtkmm) toolkit."
url="http://code.google.com/p/bombz-gtk/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtkmm')
source=(http://bombz-gtk.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('27850ceee45015b6e007250217fe08a8')

build() {
  cd $srcdir/$pkgname
  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
