# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Jan Blazek <appolito@gmail.com>
# Contributor: Mario Blättermann <mariobl@gnome.org>
# Contributor: Xavier Benderitter <phenomenologeek at gmail dot com>

pkgname=wmakerconf
pkgver=2.12
pkgrel=2
pkgdesc="configuration utility for the Window Maker"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/wmakerconf/"
license="GPL"
depends=('windowmaker' 'gtk2')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/${pkgname}_$pkgver.tar.gz wmakerconf-2.12-wm-0.95_support.patch)
md5sums=('252114b5ee5fc5bec99477497ee045cc'
         '41ffba5b16d44c43640bcf65031d6a85')

build() {

  cd $srcdir/$pkgname-$pkgver
  patch -p1 -i $srcdir/wmakerconf-2.12-wm-0.95_support.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
