# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: stalker_exe <stalkerexe8@gmail.com>

pkgname=4pane-svn
pkgver=20111002
pkgrel=1
pkgdesc="A multi-pane, detailed-list file manager. SVN version."
arch=('i686' 'x86_64')
url="http://www.4pane.co.uk/index.html"
license=('GPL3')
depends=('wxgtk')
makedepends=('subversion')
source=('4Pane.desktop')
md5sums=('b3bafbcc64bde3e3742f994574da5fdd')
conflicts=('4pane')
build() {
	svn co https://fourpane.svn.sourceforge.net/svnroot/fourpane fourpane
	cd "$srcdir"/fourpane/trunk

	./configure --prefix=/usr --disable-desktop --disable-symlink
	make
}

package() {
	make DESTDIR="$pkgdir" install

	ln -s 4Pane "$pkgdir"/usr/bin/4pane
	install -d -m755 "$pkgdir"/usr/share/{applications,pixmaps}
	install -D -m644 "$srcdir"/4Pane.desktop "$pkgdir"/usr/share/applications/
	ln -s ../4Pane/bitmaps/4PaneIcon48.png "$pkgdir"/usr/share/pixmaps/4Pane.png
}
