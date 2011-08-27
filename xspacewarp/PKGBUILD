# Contributor: Giuseppe Borzi <gborzi@ieee.org>
pkgname=xspacewarp
pkgver=1.2b
_pkgver=1.2
pkgrel=2
pkgdesc="xspacewarp (Time Trek - like game for X Window System)"
arch=('i686' 'x86_64')
url="http://blog.nielshorn.net/2010/09/xspacewarp-revisited/"
license=('GPL')
backup=('usr/share/X11/app-defaults/XSpacewarp')
depends=('libxaw' 'gcc-libs')
makedepends=('imake')
source=(http://ftp.x.org/contrib/games/$pkgname-$_pkgver.tar.gz
        http://slackbuilds.org/slackbuilds/13.1/games/$pkgname.tar.gz)
md5sums=('54aa93eb6fd3d7fa396fc47ddf3ffd15' '5c13c8935cccad166ab1df23bca1c84d')

build() {
  cd "$srcdir/$pkgname-$_pkgver"

  patch -Np1 -i $srcdir/$pkgname/version12b.patch

  xmkmf
  make xspacewarp
}
package() {
  cd "$srcdir/$pkgname-$_pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm 644 $srcdir/$pkgname/$pkgname.desktop $pkgdir/usr/share/applications/xspacewarp.desktop
  install -Dm 644 $srcdir/$pkgname/$pkgname.png $pkgdir/usr/share/pixmaps/xspacewarp.png
  install -Dm 644 $srcdir/$pkgname/$pkgname.man $pkgdir/usr/share/man/man6/$pkgname.6
  install -Dm 644 $srcdir/$pkgname/XSpacewarp $pkgdir/usr/share/X11/app-defaults/XSpacewarp
}

# vim:set ts=2 sw=2 et:
