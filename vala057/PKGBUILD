pkgname=vala057
pkgver=0.5.7
pkgrel=1
pkgdesc="Older version of valac (suitable for compiling media-applet)"
arch=('i686', 'x86_64')
url="http://live.gnome.org/Vala/"
license=('GPL')
conflicts=('vala')
install=
changelog=
source=("http://download.gnome.org/sources/vala/0.5/vala-0.5.7.tar.bz2")
md5sums=('5e6c4ce07091725d9afdac7cf00e553c')

build() {
  cd "$srcdir/vala-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/vala-$pkgver"

  make DESTDIR="$pkgdir/" install
}
