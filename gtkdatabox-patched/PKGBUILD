pkgname=gtkdatabox-patched
pkgver=0.9.1.1
pkgrel=1
pkgdesc="GtkDatabox is a widget for live display of large amounts of fluctuating numerical data."
url="http://sourceforge.net/projects/gtkdatabox/"
license="GPL"
arch=('i686' 'x86_64')
depends=()
basename=(gtkdatabox-$pkgver)
source=(http://netcologne.dl.sourceforge.net/project/gtkdatabox/gtkdatabox/$pkgver/$basename.tar.gz)
md5sums=('910921da2198ebd02ea8a7eb622916ce')

build() {
	cd $startdir/src/$basename
	git clone git://pkgs.fedoraproject.org/gtkdatabox.git fedora-patch || return 1
	patch -p1 < fedora-patch/gtkdatabox-$pkgver-gtk-2.22.patch || return 1
	sed -e 's:GTK_WIDGET_REALIZED:gtk_widget_get_realized:g' -e 's:GTK_WIDGET_STATE:gtk_widget_get_state:g' -e 's:GTK_WIDGET_VISIBLE:gtk_widget_get_visible:g' -e 's:GTK_WIDGET_DRAWABLE:gtk_widget_is_drawable:g' -i gtk/gtkdatabox_ruler.c gtk/gtkdatabox.c gtk/gtkdatabox_ruler.c || return 1
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install
}
