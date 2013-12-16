# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=grhino
pkgver=0.16.1
pkgrel=2
pkgdesc="Othello/Reversi game with strong AI targeted at experienced players."
arch=('i686' 'x86_64')
url="http://rhino.sourceforge.net/"
license=('GPL2')
depends=('libgnomeui')
source=(http://downloads.sourceforge.net/sourceforge/rhino/$pkgname-$pkgver.tar.gz)
md5sums=('7c34ed906cbb08310f575ab1e4d7f223')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  
  # Desktop icon
  install -Dm644 grhino.png $pkgdir/usr/share/pixmaps/grhino.png
  install -Dm644 desktop/grhino.desktop $pkgdir/usr/share/applications/grhino.desktop
}