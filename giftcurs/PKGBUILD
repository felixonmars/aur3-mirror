# $Id: PKGBUILD 9810 2008-08-19 04:14:46Z eric $
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Maintainer: Jason Chu <jason@archlinux.org>
# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=giftcurs
pkgver=0.6.2
pkgrel=3
pkgdesc="A curses frontend to the giFT daemon."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/giftcurs/"
license=('GPL')
depends=('ncurses>=5.6-7' 'glib2' 'gift')
source=(http://savannah.nongnu.org/download/giftcurs/giFTcurs-$pkgver.tar.gz)
md5sums=('9a34b924ea10ce0a1d62441ee2bacfff') 

build() {
  cd $srcdir/giFTcurs-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make 
  }
package () {
  cd $srcdir/giFTcurs-$pkgver
  make DESTDIR=$pkgdir install
 
}
