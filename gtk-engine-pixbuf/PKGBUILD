# Contributor: Krzysztof Malinowski <boromil@gmail.com>

pkgname=gtk-engine-pixbuf
pkgver=0.1.0
pkgrel=1
pkgdesc="Gtk pixbuf engine patched to support real transparency for insensitive (disabled) images on buttons, menus, etc."
arch=('i686' 'x86_64')
url="http://www.gnome-look.org/content/show.php/gtk2-engine-pixbuf+(Patched)?content=77783"
license=('GPL')
depends=('gtk2')
makedepends=('pkgconfig')
source=('http://www.gnome-look.org/CONTENT/content-files/77783-pixbuf-engine.tar.gz')
md5sums=('e1433831f37b5e44d4146fc1002b43f5')
options=(!libtool)

build() {
  cd $startdir/src/pixbuf-engine
  ./autogen.sh --prefix=/usr --enable-animation
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
