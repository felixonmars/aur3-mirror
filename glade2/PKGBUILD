# Contributor Eric "crak" Herrera <eric.gnome@gmail.com>
pkgname=glade2
pkgver=2.12.2
pkgrel=2
pkgdesc="A User Interface Designer for GTK+ and GNOME"
url="http://glade.gnome.org"
license="GPL"
source=(http://ftp.gnome.org/pub/GNOME/sources/glade/2.12/glade-$pkgver.tar.gz)
depends=('gtk2')
makedepends=('pkgconfig' 'rarian')
arch=(i686 x86_64)
md5sums=('881b97cf8b7320cbb82726d00c43c7a2')
     
build() {
  cd $srcdir/glade-$pkgver
  sed -i 's_#include <gtk/gtkclist.h>_#include <gtk/gtk.h>_' ${srcdir}/glade-${pkgver}/glade/gbwidgets/gbclist.c ${srcdir}/glade-${pkgver}/glade/glade_keys_dialog.c ${srcdir}/glade-${pkgver}/glade/glade_menu_editor.c ${srcdir}/glade-${pkgver}/glade/glade_project_view.h
  ./configure --prefix=/usr --disable-gnome
  make
}

package() {
  cd $srcdir/glade-$pkgver
  make DESTDIR=$pkgdir install
  find $pkgdir -name "*.la" -exec rm {} \;
}