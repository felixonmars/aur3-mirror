_pack=zenity
pkgname=octave-$_pack
pkgver=0.5.7
pkgrel=1
pkgdesc="A set of functions for creating simple graphical user interfaces. It is currently possible to create calendar windows, text entries, file selection dialogs, lists, message windows, icons in the notification area, and windows for large amount of text."
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('GPL version 2 or later')
depends=()
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_pack-$pkgver.tar.gz")
md5sums=('2833e5048c25ff5440f1a67435c25dcd')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}