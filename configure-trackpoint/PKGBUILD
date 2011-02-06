# Contributor: John Gerritse <reaphsharc@gmail.com>
pkgname=configure-trackpoint
pkgver=0.7
pkgrel=5
pkgdesc="GUI TrackPoint configuration tool for the TrackPoint driver for 2.6 linux kernel."
arch=(any)
url="http://tpctl.sourceforge.net/configure-trackpoint.html"
license=('GPL2')
depends=('libgnomeui' 'pkgconfig')
source=(http://downloads.sourceforge.net/sourceforge/tpctl/$pkgname-$pkgver.tar.gz http://files.myopera.com/thibi/files/trackpoint.png)
md5sums=('c82c65b57f22140db9f2f578e9ded779'
         '65c816d3b05431a2d3aef1ec29ffbb67')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
  install -D -m 644 $srcdir/trackpoint.png $pkgdir/usr/share/pixmaps/configure-trackpoint/trackpoint.png
}

# vim:set ts=2 sw=2 et:
