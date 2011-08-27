pkgname=gtk2-libwinmenu
pkgver=1
pkgrel=1
pkgdesc="Gtk+ module to hide menubar by default"
arch=('i686' 'x86_64')
url=('http://www.linux.org.ru/jump-message.jsp?msgid=5606544&cid=5617512')
license=('custom')
depends=('gtk2')
source=('libwinmenu.c' 'Makefile')
md5sums=('20a2e4823e8d2baf1e33de97335a040b' 'f90fd2c86b796a0c9d9e4a646539ec31')
install=('libwinmenu.install')

build() {
	#cp libwinmenu.c Makefile "$srcdir"
	cd "$srcdir"
	make
	install -Dm755 libwinmenu.so "$pkgdir/usr/lib/gtk-2.0/modules/libwinmenu.so"
}
