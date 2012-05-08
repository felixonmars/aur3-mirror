# Contributor: stalker_exe <stalkerexe8@gmail.com>

pkgname=4pane-svn
pkgver=20111002
pkgrel=1
pkgdesc="A multi-pane, detailed-list file manager. SVN version."
arch=('i686' 'x86_64')
url="http://www.4pane.co.uk/index.html"
license=('GPL3')
depends=('wxgtk')
source=('4Pane.desktop')
md5sums=('b3bafbcc64bde3e3742f994574da5fdd')
conflicts=('4pane')
build() {
  svn co https://fourpane.svn.sourceforge.net/svnroot/fourpane fourpane
  cd "$srcdir"/fourpane/trunk

  ./configure --prefix=/usr --disable-desktop --disable-symlink
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  ln -s 4Pane "$pkgdir"/usr/bin/4pane
  install -d -m755 "$pkgdir"/usr/share/{applications,pixmaps} || return 1
  install -D -m644 "$srcdir"/4Pane.desktop "$pkgdir"/usr/share/applications/ || return 1
  ln -s ../4Pane/bitmaps/4PaneIcon48.png "$pkgdir"/usr/share/pixmaps/4Pane.png
}
