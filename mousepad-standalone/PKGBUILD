# Maintainer:  swanson <webaake@gmail.com>
# Contributor: swanson

pkgname=mousepad-standalone
pkgver=0.2.16
pkgrel=1
pkgdesc="Mousepad"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL')
depends=('desktop-file-utils' 'gtk2' 'hicolor-icon-theme')
makedepends=('pkgconfig>=0.9.0')
optdepends=('libgnomeprintui: for printing support')
provides=('mousepad')
conflicts=('mousepad')
install=mousepad.install
source=(http://archive.xfce.org/src/apps/mousepad/0.2/mousepad-0.2.16.tar.bz2)
md5sums=('d98854edb76d823ac20b266fdf5a64a1')

build() {
  cd "$srcdir/mousepad-$pkgver"
  #sed -i '3 s/$/ LE/; 9 s/$/;/; 2 c\Version=1.0' data/leafpad.desktop.in
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/mousepad-$pkgver"
  make DESTDIR="$pkgdir" install
}
