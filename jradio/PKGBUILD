# Author: Johannes Marbach <jm@rapidrabbit.de>

pkgname=jradio
pkgver=0.1.3
pkgrel=1
pkgdesc="An easy to use web radio player"
arch=('i686 x86_64')
url="https://sourceforge.net/projects/jradio/"
license=(GPL)
depends=(gtkmm3 vlc libxml2 curl)
source=("https://sourceforge.net/projects/jradio/files/$pkgname-$pkgver.tar.gz")
md5sums=('9fd87667d00bee2164d285e30a490aa2')

build() { 
  cd $srcdir/$pkgname-$pkgver/
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  make PREFIX=/usr sysconfdir=/etc localstatedir=/var DESTDIR=$pkgdir install
}

post_install() {
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
}

post_upgrade() {
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
}

post_remove() {
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
}
