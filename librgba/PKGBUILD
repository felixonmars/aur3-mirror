# Maintainer: Fred Williams <thestarlion@hotmail.com>
pkgname=librgba
pkgver=0.0.4.1
pkgrel=2
pkgdesc="Another Gtk RGBA module - from Gnome-Look"
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php/Another+Gtk+RGBA+module+?content=100968"
license=('GPL')
depends=('glib2' 'gtk2' 'cairo')
makedepends=()
conflicts=('librgba-gtk-module')
install=librgba.install
source=(http://gnome-look.org/CONTENT/content-files/100968-librgba.c)
md5sums=(2baaa6fc0b218ef5e3ed3d8939d49e03)

build() {
  mkdir -p "$srcdir/usr/lib/gtk-2.0/modules"
  mv "100968-librgba.c" "$srcdir/usr/lib/gtk-2.0/modules/librgba.c"
  cd "$srcdir/usr/lib/gtk-2.0/modules"

  gcc -O2 -fPIC -shared `pkg-config --cflags --libs gtk+-2.0` librgba.c -o librgba.so
}

package() {
  cd "$srcdir/"
  mkdir -p "$pkgdir/usr/lib/gtk-2.0/modules"
  cp "$srcdir/usr/lib/gtk-2.0/modules/librgba.so" "$pkgdir/usr/lib/gtk-2.0/modules"
  DESTDIR="$pkgdir/"
}

