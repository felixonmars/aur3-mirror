# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=xcursor-silver-3d
pkgver=0.4
pkgrel=1
pkgdesc="3D animated silver cursors."
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php/Silver+XCursors+3D?content=5533"
license=("LGPL")
source=(http://gnome-look.org/CONTENT/content-files/5533-Silver-XCursors-3D-$pkgver.tar.bz2)
md5sums=('c6093c8af520421c302d029e9deb53af')

build() {
  mkdir -p $startdir/pkg/usr/share/icons/Silver_3D
  cp -r $startdir/src/Silver-XCursors-3D-0.4/Silver/* $startdir/pkg/usr/share/icons/Silver_3D/
}
